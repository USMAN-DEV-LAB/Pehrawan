import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/utils/money_utils.dart';

/// Gold discount badge. Gold (#F5B301) is reserved exclusively for discount
/// badges and rating stars.
class DiscountBadge extends StatelessWidget {
  const DiscountBadge({super.key, required this.percent, this.compact = false});

  final int percent;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (percent <= 0) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final ext = context.ext;

    return Semantics(
      label: context.l10n.offPercent(percent),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? AppSpacing.xs : AppSpacing.sm,
          vertical: compact ? 2 : AppSpacing.xxs,
        ),
        decoration: BoxDecoration(
          color: ext.gold,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Text(
          context.l10n.offPercent(percent),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              (compact
                      ? theme.textTheme.labelSmall
                      : theme.textTheme.labelMedium)
                  ?.copyWith(color: ext.goldText, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

/// Displays current price, optional strikethrough old price, and discount badge.
class PriceText extends StatelessWidget {
  const PriceText({
    super.key,
    required this.price,
    this.oldPrice,
    this.showDiscountBadge = true,
    this.large = false,
  });

  final int price;
  final int? oldPrice;
  final bool showDiscountBadge;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final prefix = context.l10n.currencyPrefix;
    final hasDiscount = oldPrice != null && oldPrice! > price;
    final discountPct = hasDiscount
        ? MoneyUtils.discountPercent(basePrice: oldPrice!, salePrice: price)
        : 0;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xxs,
      children: [
        Text(
          MoneyUtils.formatPkr(price, prefix: prefix),
          style:
              (large
                      ? theme.textTheme.headlineMedium
                      : theme.textTheme.titleMedium)
                  ?.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.w700,
                  ),
        ),
        if (hasDiscount)
          Text(
            MoneyUtils.formatPkr(oldPrice!, prefix: prefix),
            style:
                (large ? theme.textTheme.bodyMedium : theme.textTheme.bodySmall)
                    ?.copyWith(
                      color: colors.onSurfaceVariant,
                      decoration: TextDecoration.lineThrough,
                    ),
          ),
        if (showDiscountBadge && discountPct > 0)
          DiscountBadge(percent: discountPct, compact: !large),
      ],
    );
  }
}
