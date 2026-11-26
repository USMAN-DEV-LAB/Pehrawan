import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

import 'skeleton_loader.dart';

/// Circular category shortcut rendered from [Category] data.
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = context.ext;
    final langCode = context.isUrdu ? 'ur' : 'en';
    final label = category.localizedName(langCode);

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
                  placeholder: (_, _) => SkeletonBox(
                    width: size,
                    height: size,
                    borderRadius: size / 2,
                  ),
                  errorWidget: (_, _, _) => Icon(
                    Icons.checkroom_outlined,
                    color: theme.colorScheme.primary,
                  ),
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
