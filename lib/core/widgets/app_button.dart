import 'package:flutter/material.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';

enum AppButtonVariant { primary, outlined, ghost }

/// Reusable button supporting primary, outlined, ghost, loading, and disabled states.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.isExpanded = true,
    this.icon,
    this.height = 48,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool isExpanded;
  final IconData? icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final effectiveOnPressed = isLoading ? null : onPressed;
    final effectiveHeight = height < AppSpacing.minTapTarget
        ? AppSpacing.minTapTarget
        : height;

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
    );

    final Widget child = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                variant == AppButtonVariant.primary
                    ? colors.onPrimary
                    : colors.primary,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                const SizedBox(width: AppSpacing.xs),
              ],
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );

    final Widget button = switch (variant) {
      AppButtonVariant.primary => FilledButton(
        onPressed: effectiveOnPressed,
        style: FilledButton.styleFrom(
          minimumSize: Size(isExpanded ? double.infinity : 0, effectiveHeight),
          shape: shape,
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.surfaceContainerHighest,
          disabledForegroundColor: colors.onSurfaceVariant,
          textStyle: theme.textTheme.labelLarge,
        ),
        child: child,
      ),
      AppButtonVariant.outlined => OutlinedButton(
        onPressed: effectiveOnPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(isExpanded ? double.infinity : 0, effectiveHeight),
          shape: shape,
          foregroundColor: colors.primary,
          side: BorderSide(
            color: effectiveOnPressed == null ? colors.outline : colors.primary,
            width: 1.5,
          ),
          textStyle: theme.textTheme.labelLarge,
        ),
        child: child,
      ),
      AppButtonVariant.ghost => TextButton(
        onPressed: effectiveOnPressed,
        style: TextButton.styleFrom(
          minimumSize: Size(isExpanded ? double.infinity : 0, effectiveHeight),
          shape: shape,
          foregroundColor: colors.primary,
          textStyle: theme.textTheme.labelLarge,
        ),
        child: child,
      ),
    };

    return Semantics(
      button: true,
      enabled: effectiveOnPressed != null,
      label: label,
      child: button,
    );
  }
}
