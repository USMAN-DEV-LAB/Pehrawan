import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

/// Circular category shortcut rendered from [Category] data.
/// Shows a soft blush circle with a category-appropriate icon as placeholder/fallback,
/// while loading real photos from the configurable [Category.imageUrl].
class CategoryCircle extends StatelessWidget {
  const CategoryCircle({
    super.key,
    required this.category,
    required this.onTap,
    this.size = 64,
  });

  final Category category;
  final VoidCallback onTap;
  final double size;

  static IconData iconForCategory(Category category) {
    final key = '${category.id} ${category.nameEn}'.toLowerCase();
    if (key.contains('lawn')) return Icons.eco_outlined;
    if (key.contains('kurta')) return Icons.checkroom_outlined;
    if (key.contains('unstitched')) return Icons.layers_outlined;
    if (key.contains('pret')) return Icons.style_outlined;
    if (key.contains('festive')) return Icons.auto_awesome_outlined;
    if (key.contains('bridal')) return Icons.diamond_outlined;
    if (key.contains('men')) return Icons.man_outlined;
    if (key.contains('kids')) return Icons.child_care_outlined;
    if (key.contains('khussa') || key.contains('footwear')) {
      return Icons.ice_skating_outlined;
    }
    if (key.contains('sandal')) return Icons.directions_walk_outlined;
    if (key.contains('heel')) return Icons.shopping_bag_outlined;
    return Icons.category_outlined;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = context.ext;
    final langCode = context.isUrdu ? 'ur' : 'en';
    final label = category.localizedName(langCode);
    final fallbackIcon = Icon(
      iconForCategory(category),
      size: size * 0.42,
      color: theme.colorScheme.primary,
    );

    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: SizedBox(
          width: size + AppSpacing.md,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ext.blush,
                  border: Border.all(color: ext.border),
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: category.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => Center(child: fallbackIcon),
                  errorWidget: (_, _, _) => Center(child: fallbackIcon),
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                label,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
