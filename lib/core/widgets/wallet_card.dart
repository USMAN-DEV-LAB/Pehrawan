import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/utils/money_utils.dart';
import 'package:pehrawan/features/orders/domain/entities/order_entities.dart';

/// Pehrawan Wallet summary card for Profile & Checkout.
class WalletCard extends StatelessWidget {
  const WalletCard({super.key, required this.balanceRupees, this.onTopUp});

  final int balanceRupees;
  final VoidCallback? onTopUp;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primary, colors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colors.onPrimary.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: colors.onPrimary,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.walletTitle,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colors.onPrimary.withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  MoneyUtils.formatPkr(
                    balanceRupees,
                    prefix: l10n.currencyPrefix,
                  ),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          if (onTopUp != null)
            TextButton(
              onPressed: onTopUp,
              style: TextButton.styleFrom(
                backgroundColor: colors.onPrimary,
                foregroundColor: colors.primary,
                minimumSize: const Size(72, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
              ),
              child: Text(l10n.topUp),
            ),
        ],
      ),
    );
  }
}

/// Courier tracking timeline (Placed -> Packed -> Shipped -> Out for Delivery -> Delivered).
class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key, required this.steps});

  final List<OrderTimelineStep> steps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final langCode = context.isUrdu ? 'ur' : 'en';

    return Column(
      children: [
        for (int i = 0; i < steps.length; i++)
          _TimelineRow(
            step: steps[i],
            langCode: langCode,
            isLast: i == steps.length - 1,
            primaryColor: colors.primary,
            mutedColor: colors.outline,
            theme: theme,
          ),
      ],
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({
    required this.step,
    required this.langCode,
    required this.isLast,
    required this.primaryColor,
    required this.mutedColor,
    required this.theme,
  });

  final OrderTimelineStep step;
  final String langCode;
  final bool isLast;
  final Color primaryColor;
  final Color mutedColor;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final activeColor = step.isCompleted ? primaryColor : mutedColor;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: step.isCompleted ? primaryColor : Colors.transparent,
                    border: Border.all(color: activeColor, width: 2),
                  ),
                  child: step.isCompleted
                      ? Icon(
                          Icons.check_rounded,
                          size: 10,
                          color: theme.colorScheme.onPrimary,
                        )
                      : null,
                ),
                if (!isLast)
                  Expanded(child: Container(width: 2, color: activeColor)),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.localizedTitle(langCode),
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: step.isCompleted
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    step.localizedSubtitle(langCode),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
