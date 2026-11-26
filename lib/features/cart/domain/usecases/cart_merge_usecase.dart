import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

/// Pure guest-cart merge logic used when a guest signs in.
/// Matching (productId, sku) items sum quantities capped at [CartItem.maxStock].
List<CartItem> mergeGuestCartItems({
  required List<CartItem> guestItems,
  required List<CartItem> accountItems,
}) {
  final merged = List<CartItem>.from(accountItems);

  for (final guestItem in guestItems) {
    final idx = merged.indexWhere(
      (a) => a.productId == guestItem.productId && a.sku == guestItem.sku,
    );
    if (idx >= 0) {
      final existing = merged[idx];
      final maxAllowed = existing.maxStock > 0
          ? existing.maxStock
          : guestItem.maxStock;
      final combinedQty = (existing.quantity + guestItem.quantity).clamp(
        1,
        maxAllowed > 0 ? maxAllowed : 99,
      );
      merged[idx] = existing.copyWith(quantity: combinedQty);
    } else {
      merged.add(guestItem);
    }
  }

  return merged;
}

/// Computes integer rupee discount for a [Voucher] given [subtotal].
/// Returns 0 if [subtotal] < [Voucher.minOrderAmount].
int computeVoucherDiscount({required Voucher? voucher, required int subtotal}) {
  if (voucher == null || subtotal <= 0) return 0;
  if (subtotal < voucher.minOrderAmount) return 0;

  if (voucher.isPercent) {
    return ((subtotal * voucher.discountAmount) / 100).round();
  }
  return voucher.discountAmount.clamp(0, subtotal);
}
