import 'package:flutter/material.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';

/// Gold star rating display with optional review count.
class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.reviewCount,
    this.starSize = 14,
    this.showNumeric = true,
  });

  final double rating;
  final int? reviewCount;
  final double starSize;
  final bool showNumeric;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = context.ext;
    final clamped = rating.clamp(0.0, 5.0);

    return Semantics(
      label: '${clamped.toStringAsFixed(1)} out of 5 stars',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(5, (index) {
            final starValue = index + 1;
            final IconData icon;
            if (clamped >= starValue) {
              icon = Icons.star_rounded;
            } else if (clamped >= starValue - 0.5) {
              icon = Icons.star_half_rounded;
            } else {
              icon = Icons.star_outline_rounded;
            }
            return Icon(icon, size: starSize, color: ext.gold);
          }),
          if (showNumeric) ...[
            const SizedBox(width: AppSpacing.xxs),
            Text(
              clamped.toStringAsFixed(1),
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          if (reviewCount != null) ...[
            const SizedBox(width: AppSpacing.xxs),
            Flexible(
              child: Text(
                '($reviewCount)',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
