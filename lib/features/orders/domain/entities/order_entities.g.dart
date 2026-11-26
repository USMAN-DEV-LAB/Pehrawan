// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  id: json['id'] as String,
  fullName: json['fullName'] as String,
  phone: json['phone'] as String,
  streetAddress: json['streetAddress'] as String,
  area: json['area'] as String,
  city: json['city'] as String,
  postalCode: json['postalCode'] as String?,
  isDefault: json['isDefault'] as bool? ?? false,
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'phone': instance.phone,
  'streetAddress': instance.streetAddress,
  'area': instance.area,
  'city': instance.city,
  'postalCode': instance.postalCode,
  'isDefault': instance.isDefault,
};

_OrderTimelineStep _$OrderTimelineStepFromJson(Map<String, dynamic> json) =>
    _OrderTimelineStep(
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      titleEn: json['title_en'] as String,
      titleUr: json['title_ur'] as String,
      subtitleEn: json['subtitle_en'] as String,
      subtitleUr: json['subtitle_ur'] as String,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$OrderTimelineStepToJson(_OrderTimelineStep instance) =>
    <String, dynamic>{
      'status': _$OrderStatusEnumMap[instance.status]!,
      'title_en': instance.titleEn,
      'title_ur': instance.titleUr,
      'subtitle_en': instance.subtitleEn,
      'subtitle_ur': instance.subtitleUr,
      'timestamp': instance.timestamp?.toIso8601String(),
      'isCompleted': instance.isCompleted,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.placed: 'placed',
  OrderStatus.packed: 'packed',
  OrderStatus.shipped: 'shipped',
  OrderStatus.outForDelivery: 'out_for_delivery',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.returnRequested: 'return_requested',
};

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  userId: json['userId'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  totals: CartTotals.fromJson(json['totals'] as Map<String, dynamic>),
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  paymentMethod: $enumDecode(_$PaymentMethodTypeEnumMap, json['paymentMethod']),
  shippingAddress: Address.fromJson(
    json['shippingAddress'] as Map<String, dynamic>,
  ),
  timeline: (json['timeline'] as List<dynamic>)
      .map((e) => OrderTimelineStep.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  trackingNumber: json['trackingNumber'] as String?,
  courierName: json['courierName'] as String?,
  courierLat: (json['courierLat'] as num?)?.toDouble(),
  courierLng: (json['courierLng'] as num?)?.toDouble(),
  destinationLat: (json['destinationLat'] as num?)?.toDouble(),
  destinationLng: (json['destinationLng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'items': instance.items,
  'totals': instance.totals,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'paymentMethod': _$PaymentMethodTypeEnumMap[instance.paymentMethod]!,
  'shippingAddress': instance.shippingAddress,
  'timeline': instance.timeline,
  'createdAt': instance.createdAt.toIso8601String(),
  'trackingNumber': instance.trackingNumber,
  'courierName': instance.courierName,
  'courierLat': instance.courierLat,
  'courierLng': instance.courierLng,
  'destinationLat': instance.destinationLat,
  'destinationLng': instance.destinationLng,
};

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.cod: 'cod',
  PaymentMethodType.wallet: 'wallet',
  PaymentMethodType.card: 'card',
  PaymentMethodType.jazzcash: 'jazzcash',
  PaymentMethodType.easypaisa: 'easypaisa',
};

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  uid: json['uid'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  walletBalance: (json['walletBalance'] as num?)?.toInt() ?? 0,
  language: json['language'] as String? ?? 'en',
  isGuest: json['isGuest'] as bool? ?? false,
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'walletBalance': instance.walletBalance,
      'language': instance.language,
      'isGuest': instance.isGuest,
    };
