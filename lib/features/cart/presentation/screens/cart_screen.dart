import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/utils/money_utils.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';
import 'package:pehrawan/features/cart/presentation/providers/cart_providers.dart';
import 'package:pehrawan/features/catalog/presentation/providers/catalog_providers.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final _promoController = TextEditingController();
  String? _promoFeedback;
  bool _promoIsError = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  Future<void> _applyPromo(int subtotal) async {
    final l10n = context.l10n;
    final code = _promoController.text.trim().toUpperCase();
    if (code.isEmpty) return;

    final vouchers = await ref.read(vouchersProvider.future);
    final match = vouchers.where((v) => v.code.toUpperCase() == code).toList();
    if (match.isEmpty) {
      setState(() {
        _promoIsError = true;
        _promoFeedback = l10n.promoInvalid;
      });
      return;
    }

    final voucher = match.first;
    if (subtotal < voucher.minOrderAmount) {
      setState(() {
        _promoIsError = true;
        _promoFeedback = l10n.promoMinOrder(
          MoneyUtils.formatPkr(
            voucher.minOrderAmount,
            prefix: l10n.currencyPrefix,
          ),
        );
      });
      return;
    }

    ref.read(appliedVoucherProvider.notifier).state = voucher;
    setState(() {
      _promoIsError = false;
      _promoFeedback = l10n.promoApplied(voucher.code);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;
    final langCode = context.isUrdu ? 'ur' : 'en';

    final cartAsync = ref.watch(cartControllerProvider);
    final totals = ref.watch(cartTotalsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.cart)),
      body: cartAsync.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.screenMargin),
          child: SkeletonProductGrid(itemCount: 2),
        ),
        error: (_, _) =>
            ErrorState(onRetry: () => ref.invalidate(cartControllerProvider)),
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.shopping_bag_outlined,
              title: l10n.emptyCartTitle,
              subtitle: l10n.emptyCartSubtitle,
              actionLabel: l10n.shopNow,
              onAction: () => context.go(AppRoutes.home),
            );
          }

          // Group items by sellerId
          final grouped = <String, List<CartItem>>{};
          for (final item in items) {
            grouped.putIfAbsent(item.sellerName, () => []).add(item);
          }

          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(AppSpacing.screenMargin),
                  children: [
                    for (final entry in grouped.entries) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                        child: Row(
                          children: [
                            Icon(
                              Icons.storefront_outlined,
                              size: 18,
                              color: colors.primary,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(entry.key, style: theme.textTheme.titleSmall),
                          ],
                        ),
                      ),
                      for (final item in entry.value)
                        Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                          child: _CartItemCard(
                            item: item,
                            langCode: langCode,
                            onQuantityChanged: (nextQty) => ref
                                .read(cartControllerProvider.notifier)
                                .updateQuantity(item.id, nextQty),
                            onRemove: () async {
                              await ref
                                  .read(cartControllerProvider.notifier)
                                  .removeItem(item.id);
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    l10n.itemRemoved(
                                      item.localizedTitle(langCode),
                                    ),
                                  ),
                                  action: SnackBarAction(
                                    label: l10n.undo,
                                    onPressed: () => ref
                                        .read(cartControllerProvider.notifier)
                                        .addItem(item),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      const SizedBox(height: AppSpacing.sm),
                    ],

                    // Promo Code Input
                    Text(l10n.promoCode, style: theme.textTheme.titleSmall),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            controller: _promoController,
                            hint: l10n.promoCodeHint,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        AppButton(
                          label: l10n.apply,
                          isExpanded: false,
                          onPressed: () => _applyPromo(totals.subtotal),
                        ),
                      ],
                    ),
                    if (_promoFeedback != null) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        _promoFeedback!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: _promoIsError ? colors.error : ext.success,
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.lg),

                    // Order Summary using single CartTotals source
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: ext.surfaceGrey,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMd,
                        ),
                      ),
                      child: Column(
                        children: [
                          _SummaryRow(
                            label: l10n.subtotal,
                            value: MoneyUtils.formatPkr(
                              totals.subtotal,
                              prefix: l10n.currencyPrefix,
                            ),
                          ),
                          if (totals.discount > 0) ...[
                            const SizedBox(height: AppSpacing.xs),
                            _SummaryRow(
                              label: l10n.discount,
                              value:
                                  '-${MoneyUtils.formatPkr(totals.discount, prefix: l10n.currencyPrefix)}',
                              valueColor: ext.success,
                            ),
                          ],
                          const SizedBox(height: AppSpacing.xs),
                          _SummaryRow(
                            label: l10n.deliveryFee,
                            value: totals.deliveryFee == 0
                                ? l10n.free
                                : MoneyUtils.formatPkr(
                                    totals.deliveryFee,
                                    prefix: l10n.currencyPrefix,
                                  ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppSpacing.sm,
                            ),
                            child: Divider(),
                          ),
                          _SummaryRow(
                            label: l10n.total,
                            value: MoneyUtils.formatPkr(
                              totals.total,
                              prefix: l10n.currencyPrefix,
                            ),
                            bold: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: colors.surface,
                  border: Border(top: BorderSide(color: ext.border)),
                ),
                child: SafeArea(
                  top: false,
                  child: AppButton(
                    label:
                        '${l10n.proceedToCheckout} (${MoneyUtils.formatPkr(totals.total, prefix: l10n.currencyPrefix)})',
                    onPressed: () => context.push(AppRoutes.checkout),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  const _CartItemCard({
    required this.item,
    required this.langCode,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  final CartItem item;
  final String langCode;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                width: 72,
                height: 88,
                fit: BoxFit.cover,
                placeholder: (_, _) => const SkeletonBox(width: 72, height: 88),
                errorWidget: (_, _, _) =>
                    Container(width: 72, height: 88, color: ext.surfaceGrey),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.localizedTitle(langCode),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      IconButton(
                        onPressed: onRemove,
                        visualDensity: VisualDensity.compact,
                        icon: const Icon(Icons.close_rounded, size: 18),
                      ),
                    ],
                  ),
                  Text(
                    item.selectedOptions.values.join(' • '),
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      Text(
                        MoneyUtils.formatPkr(
                          item.unitPrice,
                          prefix: l10n.currencyPrefix,
                        ),
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: colors.primary,
                        ),
                      ),
                      const Spacer(),
                      _QuantityStepper(
                        quantity: item.quantity,
                        maxStock: item.maxStock,
                        onChanged: onQuantityChanged,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  const _QuantityStepper({
    required this.quantity,
    required this.maxStock,
    required this.onChanged,
  });

  final int quantity;
  final int maxStock;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final ext = context.ext;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ext.border),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: quantity > 1 ? () => onChanged(quantity - 1) : null,
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.remove_rounded, size: 16),
          ),
          Text('$quantity', style: Theme.of(context).textTheme.labelLarge),
          IconButton(
            onPressed: quantity < maxStock
                ? () => onChanged(quantity + 1)
                : null,
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.add_rounded, size: 16),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.bold = false,
    this.valueColor,
  });

  final String label;
  final String value;
  final bool bold;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = bold
        ? theme.textTheme.titleMedium
        : theme.textTheme.bodyMedium;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(
          value,
          style: style?.copyWith(
            color: valueColor ?? (bold ? theme.colorScheme.primary : null),
            fontWeight: bold ? FontWeight.w700 : null,
          ),
        ),
      ],
    );
  }
}
