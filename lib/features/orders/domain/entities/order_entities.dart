import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';

part 'order_entities.freezed.dart';
part 'order_entities.g.dart';

enum OrderStatus {
  @JsonValue('placed')
  placed,
  @JsonValue('packed')
  packed,
  @JsonValue('shipped')
  shipped,
  @JsonValue('out_for_delivery')
  outForDelivery,
  @JsonValue('delivered')
  delivered,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('return_requested')
  returnRequested,
}

enum PaymentMethodType {
  @JsonValue('cod')
  cod,
  @JsonValue('wallet')
  wallet,
  @JsonValue('card')
  card,
  @JsonValue('jazzcash')
  jazzcash,
  @JsonValue('easypaisa')
  easypaisa,
}

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String id,
    required String fullName,
    required String phone,
    required String streetAddress,
    required String area,
    required String city,
    String? postalCode,
    @Default(false) bool isDefault,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
abstract class OrderTimelineStep with _$OrderTimelineStep {
  const OrderTimelineStep._();

  const factory OrderTimelineStep({
    required OrderStatus status,
    @JsonKey(name: 'title_en') required String titleEn,
    @JsonKey(name: 'title_ur') required String titleUr,
    @JsonKey(name: 'subtitle_en') required String subtitleEn,
    @JsonKey(name: 'subtitle_ur') required String subtitleUr,
    DateTime? timestamp,
    required bool isCompleted,
  }) = _OrderTimelineStep;

  factory OrderTimelineStep.fromJson(Map<String, dynamic> json) =>
      _$OrderTimelineStepFromJson(json);

  String localizedTitle(String langCode) =>
      langCode == 'ur' ? titleUr : titleEn;
  String localizedSubtitle(String langCode) =>
      langCode == 'ur' ? subtitleUr : subtitleEn;
}

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    required String userId,
    required List<CartItem> items,
    required CartTotals totals,
    required OrderStatus status,
    required PaymentMethodType paymentMethod,
    required Address shippingAddress,
    required List<OrderTimelineStep> timeline,
    required DateTime createdAt,
    String? trackingNumber,
    String? courierName,
    double? courierLat,
    double? courierLng,
    double? destinationLat,
    double? destinationLng,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required String name,
    required String phone,
    String? email,
    String? avatarUrl,
    @Default(0) int walletBalance,
    @Default('en') String language,
    @Default(false) bool isGuest,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
