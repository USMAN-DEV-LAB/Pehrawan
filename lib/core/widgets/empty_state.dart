import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';

import 'app_button.dart';

/// Standardized empty state with icon, title, subtitle, and optional CTA.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: ext.blush,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 34, color: colors.primary),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: actionLabel!,
                onPressed: onAction,
                isExpanded: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Standardized friendly error state with retry action (never shows raw exceptions).
class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    this.title,
    this.subtitle,
    required this.onRetry,
    this.icon = Icons.error_outline_rounded,
  });

  final String? title;
  final String? subtitle;
  final VoidCallback onRetry;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return EmptyState(
      icon: icon,
      title: title ?? l10n.errorGenericTitle,
      subtitle: subtitle ?? l10n.errorGenericSubtitle,
      actionLabel: l10n.retry,
      onAction: onRetry,
    );
  }
}

/// Non-intrusive offline banner shown when device has no connectivity.
class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key, this.onRetry});

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = context.ext;
    final l10n = context.l10n;

    return Material(
      color: ext.warningLight,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenMargin,
            vertical: AppSpacing.xs,
          ),
          child: Row(
            children: [
              Icon(Icons.wifi_off_rounded, size: 18, color: ext.warning),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  l10n.offlineMessage,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              if (onRetry != null)
                TextButton(
                  onPressed: onRetry,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(44, 36),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xs,
                    ),
                  ),
                  child: Text(l10n.retry),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
