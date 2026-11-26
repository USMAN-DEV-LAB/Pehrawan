import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/utils/money_utils.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

import 'price_text.dart';
import 'rating_stars.dart';
import 'skeleton_loader.dart';

/// Category-neutral product card showing image, title, price, old price,
/// discount badge, rating, and wishlist heart.
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.isWishlisted = false,
    this.onWishlistTap,
    this.width,
  });

  final Product product;
  final VoidCallback onTap;
  final bool isWishlisted;
  final VoidCallback? onWishlistTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;
    final langCode = context.isUrdu ? 'ur' : 'en';
    final title = product.localizedTitle(langCode);
    final discountPct = product.hasDiscount
        ? MoneyUtils.discountPercent(
            basePrice: product.basePrice,
            salePrice: product.salePrice,
          )
        : 0;

    return Semantics(
      button: true,
      label: title,
      child: SizedBox(
        width: width,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 0.85,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (product.images.isNotEmpty)
                        CachedNetworkImage(
                          imageUrl: product.images.first,
                          fit: BoxFit.cover,
                          placeholder: (_, _) => const SkeletonBox(
                            width: double.infinity,
                            height: double.infinity,
                            borderRadius: 0,
                          ),
                          errorWidget: (_, _, _) => Container(
                            color: ext.surfaceGrey,
                            child: Icon(
                              Icons.image_outlined,
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        )
                      else
                        Container(color: ext.surfaceGrey),
                      if (discountPct > 0)
                        Positioned(
                          top: AppSpacing.xs,
                          left: AppSpacing.xs,
                          child: DiscountBadge(
                            percent: discountPct,
                            compact: true,
                          ),
                        ),
                      if (onWishlistTap != null)
                        Positioned(
                          top: AppSpacing.xxs,
                          right: AppSpacing.xxs,
                          child: Semantics(
                            button: true,
                            label: isWishlisted
                                ? 'Remove from wishlist'
                                : 'Add to wishlist',
                            child: Material(
                              color: colors.surface.withValues(alpha: 0.88),
                              shape: const CircleBorder(),
                              child: InkWell(
                                onTap: onWishlistTap,
                                customBorder: const CircleBorder(),
                                child: SizedBox(
                                  width: AppSpacing.minTapTarget,
                                  height: AppSpacing.minTapTarget,
                                  child: Icon(
                                    isWishlisted
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    size: 20,
                                    color: isWishlisted
                                        ? colors.primary
                                        : colors.onSurface,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      PriceText(
                        price: product.effectivePrice,
                        oldPrice: product.hasDiscount
                            ? product.basePrice
                            : null,
                        showDiscountBadge: false,
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      RatingStars(
                        rating: product.ratingAvg,
                        reviewCount: product.ratingCount,
                        starSize: 13,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
