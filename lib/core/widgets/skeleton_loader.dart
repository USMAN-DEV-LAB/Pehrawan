import 'package:flutter/material.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

/// Shimmer skeleton box for loading placeholders.
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = AppSpacing.radiusSm,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final ext = context.ext;
    return Shimmer.fromColors(
      baseColor: ext.shimmerBase,
      highlightColor: ext.shimmerHighlight,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ext.shimmerBase,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// Product grid skeleton loader.
class SkeletonProductGrid extends StatelessWidget {
  const SkeletonProductGrid({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenMargin),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.sm,
        crossAxisSpacing: AppSpacing.sm,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (_, _) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SkeletonBox(
              width: double.infinity,
              height: double.infinity,
              borderRadius: AppSpacing.radiusMd,
            ),
          ),
          SizedBox(height: AppSpacing.xs),
          SkeletonBox(width: 120, height: 14),
          SizedBox(height: AppSpacing.xxs),
          SkeletonBox(width: 80, height: 14),
        ],
      ),
    );
  }
}
