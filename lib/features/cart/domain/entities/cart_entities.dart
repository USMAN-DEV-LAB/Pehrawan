import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pehrawan/core/config/remote_config_values.dart';

part 'cart_entities.freezed.dart';
part 'cart_entities.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required String id,
    required String productId,
    required String sellerId,
    required String sellerName,
    required String titleEn,
    required String titleUr,
    required String imageUrl,
    required String sku,
    required Map<String, String> selectedOptions,
    required int unitPrice,
    required int quantity,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  int get lineTotal => unitPrice * quantity;

  String localizedTitle(String langCode) =>
      langCode == 'ur' ? titleUr : titleEn;
}

/// Single source of truth for cart, checkout, and order summary totals.
/// All values are integer rupees.
@freezed
abstract class CartTotals with _$CartTotals {
  const CartTotals._();

  const factory CartTotals({
    required int subtotal,
    required int discount,
    required int deliveryFee,
    required int total,
    required int itemCount,
  }) = _CartTotals;

  factory CartTotals.fromJson(Map<String, dynamic> json) =>
      _$CartTotalsFromJson(json);

  /// Computes consistent totals:
  /// total = sum(item price * qty) - discount + deliveryFee.
  factory CartTotals.compute({
    required List<CartItem> items,
    int discount = 0,
    int? customDeliveryFee,
    RemoteConfigValues config = const RemoteConfigValues(),
  }) {
    final subtotal = items.fold<int>(0, (sum, item) => sum + item.lineTotal);
    final itemCount = items.fold<int>(0, (sum, item) => sum + item.quantity);

    if (items.isEmpty || subtotal == 0) {
      return const CartTotals(
        subtotal: 0,
        discount: 0,
        deliveryFee: 0,
        total: 0,
        itemCount: 0,
      );
    }

    final safeDiscount = discount.clamp(0, subtotal);
    final afterDiscount = subtotal - safeDiscount;
    final deliveryFee =
        customDeliveryFee ??
        (afterDiscount >= config.freeDeliveryThresholdRupees
            ? 0
            : config.deliveryFeeRupees);

    final total = afterDiscount + deliveryFee;

    return CartTotals(
      subtotal: subtotal,
      discount: safeDiscount,
      deliveryFee: deliveryFee,
      total: total < 0 ? 0 : total,
      itemCount: itemCount,
    );
  }
}
