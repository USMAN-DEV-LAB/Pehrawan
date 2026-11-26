import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';
import 'package:pehrawan/features/cart/presentation/providers/cart_providers.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';
import 'package:pehrawan/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:pehrawan/features/product/presentation/providers/product_detail_provider.dart';
import 'package:pehrawan/features/wishlist/presentation/providers/wishlist_providers.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final String productId;

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final _galleryController = PageController();
  int _imageIndex = 0;
  int _activeTabIndex = 0;
  Map<String, String> _selectedOptions = {};

  @override
  void dispose() {
    _galleryController.dispose();
    super.dispose();
  }

  ProductVariant? _matchingVariant(Product product) {
    if (product.variants.isEmpty) return null;
    for (final v in product.variants) {
      final matches = _selectedOptions.entries.every(
        (e) => v.options[e.key] == e.value,
      );
      if (matches && _selectedOptions.length >= v.options.length) {
        return v;
      }
    }
    return null;
  }

  bool _allOptionsSelected(AttributeSchema? schema) {
    if (schema == null || schema.attributes.isEmpty) return true;
    return schema.attributes.every(
      (attr) => (_selectedOptions[attr.key] ?? '').isNotEmpty,
    );
  }

  Future<void> _handleAddToCart(
    ProductDetailData data, {
    required bool buyNow,
  }) async {
    final l10n = context.l10n;
    final product = data.product;

    if (!_allOptionsSelected(data.schema)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l10n.selectAllOptions)));
      return;
    }

    final variant = _matchingVariant(product);
    final stock = variant?.stock ?? product.totalStock;
    if (stock <= 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l10n.outOfStock)));
      return;
    }

    final sku =
        variant?.sku ?? '${product.id}-${_selectedOptions.values.join('-')}';
    final item = CartItem(
      id: '${product.id}_$sku',
      productId: product.id,
      sellerId: product.sellerId,
      sellerName: data.seller?.name ?? 'Pehrawan Official',
      titleEn: product.titleEn,
      titleUr: product.titleUr,
      imageUrl: product.images.isNotEmpty ? product.images.first : '',
      sku: sku,
      selectedOptions: Map<String, String>.unmodifiable(_selectedOptions),
      unitPrice: variant?.price ?? product.effectivePrice,
      quantity: 1,
      maxStock: stock,
    );

    await ref.read(cartControllerProvider.notifier).addItem(item);
    if (!mounted) return;

    if (buyNow) {
      context.go(AppRoutes.cart);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.addedToCart),
          action: SnackBarAction(
            label: l10n.viewCart,
            onPressed: () => context.go(AppRoutes.cart),
          ),
        ),
      );
    }
  }

  void _openZoomGallery(List<String> images, int initialIndex) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            PageView.builder(
              controller: PageController(initialPage: initialIndex),
              itemCount: images.length,
              itemBuilder: (_, i) => InteractiveViewer(
                minScale: 1.0,
                maxScale: 4.0,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: images[i],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: AppSpacing.md,
              right: AppSpacing.md,
              child: SafeArea(
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;
    final langCode = context.isUrdu ? 'ur' : 'en';

    final detailAsync = ref.watch(productDetailProvider(widget.productId));
    final wishlistState = ref.watch(wishlistControllerProvider).valueOrNull;
    final isWishlisted = wishlistState?.ids.contains(widget.productId) ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const PehrawanLogo(horizontal: true, markSize: 24),
        actions: [
          IconButton(
            tooltip: l10n.cart,
            onPressed: () => context.go(AppRoutes.cart),
            icon: Badge(
              isLabelVisible: ref.watch(cartBadgeCountProvider) > 0,
              label: Text('${ref.watch(cartBadgeCountProvider)}'),
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: detailAsync.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.screenMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonBox(
                width: double.infinity,
                height: 320,
                borderRadius: AppSpacing.radiusMd,
              ),
              SizedBox(height: AppSpacing.md),
              SkeletonBox(width: 240, height: 22),
              SizedBox(height: AppSpacing.xs),
              SkeletonBox(width: 140, height: 18),
            ],
          ),
        ),
        error: (_, _) => ErrorState(
          onRetry: () =>
              ref.invalidate(productDetailProvider(widget.productId)),
        ),
        data: (data) {
          final product = data.product;
          final variant = _matchingVariant(product);
          final variantStock = variant?.stock;
          final effectivePrice = variant?.price ?? product.effectivePrice;

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    // Image Gallery with Pinch-Zoom & Dots
                    SizedBox(
                      height: 340,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _galleryController,
                            itemCount: product.images.length,
                            onPageChanged: (i) =>
                                setState(() => _imageIndex = i),
                            itemBuilder: (_, i) => GestureDetector(
                              onTap: () => _openZoomGallery(product.images, i),
                              child: InteractiveViewer(
                                minScale: 1.0,
                                maxScale: 3.0,
                                child: CachedNetworkImage(
                                  imageUrl: product.images[i],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  placeholder: (_, _) => const SkeletonBox(
                                    width: double.infinity,
                                    height: 340,
                                    borderRadius: 0,
                                  ),
                                  errorWidget: (_, _, _) => ColoredBox(
                                    color: ext.surfaceGrey,
                                    child: Icon(
                                      Icons.image_outlined,
                                      size: 48,
                                      color: colors.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: AppSpacing.sm,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(product.images.length, (
                                i,
                              ) {
                                final active = i == _imageIndex;
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  width: active ? 18 : 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: active
                                        ? colors.primary
                                        : colors.surface.withValues(alpha: 0.7),
                                    borderRadius: BorderRadius.circular(
                                      AppSpacing.radiusPill,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.screenMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.localizedTitle(langCode),
                            style: theme.textTheme.headlineSmall,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Row(
                            children: [
                              RatingStars(
                                rating: product.ratingAvg,
                                reviewCount: product.ratingCount,
                              ),
                              const Spacer(),
                              if (data.seller != null)
                                Text(
                                  l10n.soldBy(data.seller!.name),
                                  style: theme.textTheme.labelSmall,
                                ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          PriceText(
                            price: effectivePrice,
                            oldPrice: product.hasDiscount
                                ? product.basePrice
                                : null,
                            large: true,
                          ),
                          const SizedBox(height: AppSpacing.md),

                          // Schema-driven VariantSelector
                          if (data.schema != null)
                            VariantSelector(
                              schema: data.schema!,
                              selectedOptions: _selectedOptions,
                              variants: product.variants,
                              onOptionSelected: (k, v) {
                                setState(() {
                                  _selectedOptions = {
                                    ..._selectedOptions,
                                    k: v,
                                  };
                                });
                              },
                            ),

                          // Per-variant stock status
                          if (variantStock != null) ...[
                            Text(
                              variantStock <= 0
                                  ? l10n.outOfStock
                                  : variantStock <= 5
                                  ? l10n.onlyNLeft(variantStock)
                                  : l10n.inStock,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: variantStock <= 0
                                    ? colors.error
                                    : variantStock <= 5
                                    ? ext.warning
                                    : ext.success,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.md),
                          ],

                          TrustBadgeRow(
                            returnDays: product.returnPolicyDays,
                            codAvailable: product.codAvailable,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(
                              Icons.local_shipping_outlined,
                              color: colors.primary,
                            ),
                            title: Text(l10n.deliveryEstimate),
                            subtitle: Text(product.deliveryInfo),
                          ),
                          const Divider(),
                          const SizedBox(height: AppSpacing.sm),

                          // Details / Reviews / Q&A Tabs
                          Row(
                            children: [
                              _DetailTabChip(
                                label: l10n.detailsTab,
                                selected: _activeTabIndex == 0,
                                onTap: () =>
                                    setState(() => _activeTabIndex = 0),
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              _DetailTabChip(
                                label: l10n.reviewsTab,
                                selected: _activeTabIndex == 1,
                                onTap: () =>
                                    setState(() => _activeTabIndex = 1),
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              _DetailTabChip(
                                label: l10n.qaTab,
                                selected: _activeTabIndex == 2,
                                onTap: () =>
                                    setState(() => _activeTabIndex = 2),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          if (_activeTabIndex == 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (product
                                    .localizedDescription(langCode)
                                    .isNotEmpty)
                                  Text(
                                    product.localizedDescription(langCode),
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                const SizedBox(height: AppSpacing.xs),
                                for (final entry in product.attributes.entries)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      '${entry.key}: ${entry.value}',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ),
                              ],
                            )
                          else if (_activeTabIndex == 1)
                            Text(
                              l10n.noReviewsYet,
                              style: theme.textTheme.bodyMedium,
                            )
                          else
                            Text(
                              l10n.qaSampleQuestion,
                              style: theme.textTheme.bodyMedium,
                            ),
                        ],
                      ),
                    ),

                    if (data.similarProducts.isNotEmpty) ...[
                      SectionHeader(title: l10n.similarProducts),
                      const SizedBox(height: AppSpacing.sm),
                      SizedBox(
                        height: 336,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.screenMargin,
                          ),
                          itemCount: data.similarProducts.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(width: AppSpacing.sm),
                          itemBuilder: (_, i) {
                            final sim = data.similarProducts[i];
                            return ProductCard(
                              width: 170,
                              product: sim,
                              isWishlisted:
                                  wishlistState?.ids.contains(sim.id) ?? false,
                              onWishlistTap: () => ref
                                  .read(wishlistControllerProvider.notifier)
                                  .toggleProduct(sim.id),
                              onTap: () => context.push(
                                '${AppRoutes.productBase}/${sim.id}',
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                    ],
                  ],
                ),
              ),

              // Sticky Bottom Bar
              Container(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  AppSpacing.xs,
                  AppSpacing.md,
                  AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: colors.surface,
                  border: Border(top: BorderSide(color: ext.border)),
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      IconButton(
                        tooltip: l10n.chat,
                        onPressed: () => ScaffoldMessenger.of(context)
                            .showSnackBar(
                              SnackBar(content: Text(l10n.chatSellerHint)),
                            ),
                        icon: const Icon(Icons.chat_bubble_outline_rounded),
                      ),
                      IconButton(
                        key: const ValueKey('detail_wishlist_btn'),
                        tooltip: l10n.wishlistTitle,
                        onPressed: () {
                          ref
                              .read(wishlistControllerProvider.notifier)
                              .toggleProduct(product.id);
                          ref
                              .read(wishlistIdsProvider.notifier)
                              .toggle(product.id);
                        },
                        icon: Icon(
                          isWishlisted
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isWishlisted ? colors.primary : null,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Expanded(
                        child: AppButton(
                          key: const ValueKey('add_to_cart_btn'),
                          label: l10n.addToCart,
                          variant: AppButtonVariant.outlined,
                          onPressed: () =>
                              _handleAddToCart(data, buyNow: false),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Expanded(
                        child: AppButton(
                          key: const ValueKey('buy_now_btn'),
                          label: l10n.buyNow,
                          onPressed: () => _handleAddToCart(data, buyNow: true),
                        ),
                      ),
                    ],
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

class _DetailTabChip extends StatelessWidget {
  const _DetailTabChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      selectedColor: colors.primaryContainer,
      onSelected: (_) => onTap(),
    );
  }
}
