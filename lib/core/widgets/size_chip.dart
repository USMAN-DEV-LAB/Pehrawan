import 'package:flutter/material.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';

/// Selectable chip for sizes and other discrete options.
class SizeChip extends StatelessWidget {
  const SizeChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.enabled = true,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;

    return Semantics(
      button: true,
      selected: selected,
      enabled: enabled,
      label: label,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: AppSpacing.minTapTarget,
            minHeight: AppSpacing.minTapTarget,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: !enabled
                  ? ext.surfaceGrey
                  : selected
                  ? colors.primaryContainer
                  : colors.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              border: Border.all(
                color: !enabled
                    ? ext.border
                    : selected
                    ? colors.primary
                    : ext.border,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: !enabled
                    ? colors.onSurfaceVariant
                    : selected
                    ? colors.primary
                    : colors.onSurface,
                decoration: !enabled ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Circular color swatch selector with 44dp minimum tap target.
class AppColorSwatch extends StatelessWidget {
  const AppColorSwatch({
    super.key,
    required this.color,
    required this.label,
    required this.selected,
    required this.onTap,
    this.enabled = true,
  });

  final Color color;
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final ext = context.ext;

    return Semantics(
      button: true,
      selected: selected,
      enabled: enabled,
      label: label,
      child: Tooltip(
        message: label,
        child: InkWell(
          onTap: enabled ? onTap : null,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: AppSpacing.minTapTarget,
            height: AppSpacing.minTapTarget,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                width: 30,
                height: 30,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? colors.primary : ext.border,
                    width: selected ? 2 : 1,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: enabled ? color : color.withValues(alpha: 0.35),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
