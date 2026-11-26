// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  id: json['id'] as String,
  productId: json['productId'] as String,
  sellerId: json['sellerId'] as String,
  sellerName: json['sellerName'] as String,
  titleEn: json['titleEn'] as String,
  titleUr: json['titleUr'] as String,
  imageUrl: json['imageUrl'] as String,
  sku: json['sku'] as String,
  selectedOptions: Map<String, String>.from(json['selectedOptions'] as Map),
  unitPrice: (json['unitPrice'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'sellerId': instance.sellerId,
  'sellerName': instance.sellerName,
  'titleEn': instance.titleEn,
  'titleUr': instance.titleUr,
  'imageUrl': instance.imageUrl,
  'sku': instance.sku,
  'selectedOptions': instance.selectedOptions,
  'unitPrice': instance.unitPrice,
  'quantity': instance.quantity,
};

_CartTotals _$CartTotalsFromJson(Map<String, dynamic> json) => _CartTotals(
  subtotal: (json['subtotal'] as num).toInt(),
  discount: (json['discount'] as num).toInt(),
  deliveryFee: (json['deliveryFee'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  itemCount: (json['itemCount'] as num).toInt(),
);

Map<String, dynamic> _$CartTotalsToJson(_CartTotals instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'deliveryFee': instance.deliveryFee,
      'total': instance.total,
      'itemCount': instance.itemCount,
    };
