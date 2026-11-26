import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';

/// Section header with title, optional trailing widget (e.g. timer), and See All action.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.onSeeAll,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.screenMargin,
    ),
  });

  final String title;
  final Widget? trailing;
  final VoidCallback? onSeeAll;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: padding,
      child: Row(
        children: [
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineSmall,
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: AppSpacing.sm),
            trailing!,
          ],
          const Spacer(),
          if (onSeeAll != null)
            TextButton(
              onPressed: onSeeAll,
              style: TextButton.styleFrom(
                minimumSize: const Size(
                  AppSpacing.minTapTarget,
                  AppSpacing.minTapTarget,
                ),
                foregroundColor: colors.primary,
              ),
              child: Text(context.l10n.seeAll),
            ),
        ],
      ),
    );
  }
}

/// Trust badge row displaying COD, 7-day return, and 100% original guarantee.
class TrustBadgeRow extends StatelessWidget {
  const TrustBadgeRow({
    super.key,
    this.returnDays = 7,
    this.codAvailable = true,
  });

  final int returnDays;
  final bool codAvailable;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ext = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: ext.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Row(
        children: [
          if (codAvailable)
            Expanded(
              child: _TrustItem(
                icon: Icons.payments_outlined,
                label: l10n.codLabel,
              ),
            ),
          Expanded(
            child: _TrustItem(
              icon: Icons.assignment_return_outlined,
              label: l10n.returnPolicyDays(returnDays),
            ),
          ),
          Expanded(
            child: _TrustItem(
              icon: Icons.verified_outlined,
              label: l10n.originalGuarantee,
            ),
          ),
        ],
      ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  const _TrustItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
