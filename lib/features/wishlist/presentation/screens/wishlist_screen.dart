import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/wishlist/presentation/providers/wishlist_providers.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;
    final langCode = context.isUrdu ? 'ur' : 'en';
    final wishlistAsync = ref.watch(wishlistControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.wishlistTitle)),
      body: wishlistAsync.when(
        loading: () => const Padding(
          padding: EdgeInsets.only(top: AppSpacing.md),
          child: SkeletonProductGrid(itemCount: 4),
        ),
        error: (_, _) => ErrorState(
          onRetry: () => ref.invalidate(wishlistControllerProvider),
        ),
        data: (state) {
          if (state.products.isEmpty) {
            return EmptyState(
              icon: Icons.favorite_border_rounded,
              title: l10n.emptyWishlistTitle,
              subtitle: l10n.emptyWishlistSubtitle,
              actionLabel: l10n.shopNow,
              onAction: () => context.go(AppRoutes.home),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.screenMargin),
            itemCount: state.products.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              final p = state.products[index];
              final alertEnabled = state.priceDropAlertIds.contains(p.id);

              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => context.push('${AppRoutes.productBase}/${p.id}'),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusSm,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: p.images.first,
                                width: 76,
                                height: 92,
                                fit: BoxFit.cover,
                                placeholder: (_, _) =>
                                    const SkeletonBox(width: 76, height: 92),
                                errorWidget: (_, _, _) => Container(
                                  width: 76,
                                  height: 92,
                                  color: ext.surfaceGrey,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.localizedTitle(langCode),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  const SizedBox(height: AppSpacing.xxs),
                                  PriceText(
                                    price: p.effectivePrice,
                                    oldPrice: p.hasDiscount
                                        ? p.basePrice
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              tooltip: 'Remove',
                              onPressed: () => ref
                                  .read(wishlistControllerProvider.notifier)
                                  .toggleProduct(p.id),
                              icon: Icon(
                                Icons.delete_outline_rounded,
                                color: colors.error,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        SwitchListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            l10n.priceDropAlert,
                            style: theme.textTheme.labelMedium,
                          ),
                          value: alertEnabled,
                          onChanged: (val) => ref
                              .read(wishlistControllerProvider.notifier)
                              .togglePriceDropAlert(p.id, val),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
