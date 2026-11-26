// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Department _$DepartmentFromJson(Map<String, dynamic> json) => _Department(
  id: json['id'] as String,
  nameEn: json['name_en'] as String,
  nameUr: json['name_ur'] as String,
  icon: json['icon'] as String,
  sortOrder: (json['sortOrder'] as num).toInt(),
  isActive: json['isActive'] as bool,
);

Map<String, dynamic> _$DepartmentToJson(_Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_ur': instance.nameUr,
      'icon': instance.icon,
      'sortOrder': instance.sortOrder,
      'isActive': instance.isActive,
    };

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  departmentId: json['departmentId'] as String,
  parentId: json['parentId'] as String?,
  nameEn: json['name_en'] as String,
  nameUr: json['name_ur'] as String,
  imageUrl: json['imageUrl'] as String,
  sortOrder: (json['sortOrder'] as num).toInt(),
  isActive: json['isActive'] as bool,
  attributeSchemaId: json['attributeSchemaId'] as String?,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'departmentId': instance.departmentId,
  'parentId': instance.parentId,
  'name_en': instance.nameEn,
  'name_ur': instance.nameUr,
  'imageUrl': instance.imageUrl,
  'sortOrder': instance.sortOrder,
  'isActive': instance.isActive,
  'attributeSchemaId': instance.attributeSchemaId,
};

_AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) =>
    _AttributeValue(
      value: json['value'] as String,
      labelEn: json['label_en'] as String,
      labelUr: json['label_ur'] as String,
      colorHex: json['colorHex'] as String?,
    );

Map<String, dynamic> _$AttributeValueToJson(_AttributeValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label_en': instance.labelEn,
      'label_ur': instance.labelUr,
      'colorHex': instance.colorHex,
    };

_AttributeDefinition _$AttributeDefinitionFromJson(Map<String, dynamic> json) =>
    _AttributeDefinition(
      id: json['id'] as String,
      key: json['key'] as String,
      labelEn: json['label_en'] as String,
      labelUr: json['label_ur'] as String,
      type: $enumDecode(_$AttributeDisplayTypeEnumMap, json['type']),
      values: (json['values'] as List<dynamic>)
          .map((e) => AttributeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttributeDefinitionToJson(
  _AttributeDefinition instance,
) => <String, dynamic>{
  'id': instance.id,
  'key': instance.key,
  'label_en': instance.labelEn,
  'label_ur': instance.labelUr,
  'type': _$AttributeDisplayTypeEnumMap[instance.type]!,
  'values': instance.values,
};

const _$AttributeDisplayTypeEnumMap = {
  AttributeDisplayType.chip: 'chip',
  AttributeDisplayType.swatch: 'swatch',
  AttributeDisplayType.text: 'text',
};

_AttributeSchema _$AttributeSchemaFromJson(Map<String, dynamic> json) =>
    _AttributeSchema(
      id: json['id'] as String,
      name: json['name'] as String,
      attributes: (json['attributes'] as List<dynamic>)
          .map((e) => AttributeDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttributeSchemaToJson(_AttributeSchema instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'attributes': instance.attributes,
    };

_ProductVariant _$ProductVariantFromJson(Map<String, dynamic> json) =>
    _ProductVariant(
      sku: json['sku'] as String,
      options: Map<String, String>.from(json['options'] as Map),
      price: (json['price'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$ProductVariantToJson(_ProductVariant instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'options': instance.options,
      'price': instance.price,
      'stock': instance.stock,
      'images': instance.images,
    };

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  titleEn: json['title_en'] as String,
  titleUr: json['title_ur'] as String,
  categoryId: json['categoryId'] as String,
  sellerId: json['sellerId'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  basePrice: (json['basePrice'] as num).toInt(),
  salePrice: (json['salePrice'] as num).toInt(),
  currency: json['currency'] as String? ?? 'PKR',
  ratingAvg: (json['ratingAvg'] as num?)?.toDouble() ?? 0.0,
  ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
  soldCount: (json['soldCount'] as num?)?.toInt() ?? 0,
  attributes:
      (json['attributes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const <String, String>{},
  variants:
      (json['variants'] as List<dynamic>?)
          ?.map((e) => ProductVariant.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProductVariant>[],
  deliveryInfo:
      json['deliveryInfo'] as String? ?? '2-4 business days across Pakistan',
  returnPolicyDays: (json['returnPolicyDays'] as num?)?.toInt() ?? 7,
  codAvailable: json['codAvailable'] as bool? ?? true,
  isActive: json['isActive'] as bool? ?? true,
  isFlashSale: json['isFlashSale'] as bool? ?? false,
  descriptionEn: json['descriptionEn'] as String?,
  descriptionUr: json['descriptionUr'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'title_en': instance.titleEn,
  'title_ur': instance.titleUr,
  'categoryId': instance.categoryId,
  'sellerId': instance.sellerId,
  'images': instance.images,
  'basePrice': instance.basePrice,
  'salePrice': instance.salePrice,
  'currency': instance.currency,
  'ratingAvg': instance.ratingAvg,
  'ratingCount': instance.ratingCount,
  'soldCount': instance.soldCount,
  'attributes': instance.attributes,
  'variants': instance.variants,
  'deliveryInfo': instance.deliveryInfo,
  'returnPolicyDays': instance.returnPolicyDays,
  'codAvailable': instance.codAvailable,
  'isActive': instance.isActive,
  'isFlashSale': instance.isFlashSale,
  'descriptionEn': instance.descriptionEn,
  'descriptionUr': instance.descriptionUr,
};

_Seller _$SellerFromJson(Map<String, dynamic> json) => _Seller(
  id: json['id'] as String,
  name: json['name'] as String,
  city: json['city'] as String,
  rating: (json['rating'] as num).toDouble(),
  isVerified: json['isVerified'] as bool? ?? true,
);

Map<String, dynamic> _$SellerToJson(_Seller instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'city': instance.city,
  'rating': instance.rating,
  'isVerified': instance.isVerified,
};

_BannerItem _$BannerItemFromJson(Map<String, dynamic> json) => _BannerItem(
  id: json['id'] as String,
  titleEn: json['title_en'] as String,
  titleUr: json['title_ur'] as String,
  subtitleEn: json['subtitle_en'] as String,
  subtitleUr: json['subtitle_ur'] as String,
  imageUrl: json['imageUrl'] as String,
  targetRoute: json['targetRoute'] as String,
  sortOrder: (json['sortOrder'] as num).toInt(),
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$BannerItemToJson(_BannerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_en': instance.titleEn,
      'title_ur': instance.titleUr,
      'subtitle_en': instance.subtitleEn,
      'subtitle_ur': instance.subtitleUr,
      'imageUrl': instance.imageUrl,
      'targetRoute': instance.targetRoute,
      'sortOrder': instance.sortOrder,
      'isActive': instance.isActive,
    };

_Voucher _$VoucherFromJson(Map<String, dynamic> json) => _Voucher(
  id: json['id'] as String,
  code: json['code'] as String,
  titleEn: json['title_en'] as String,
  titleUr: json['title_ur'] as String,
  discountAmount: (json['discountAmount'] as num).toInt(),
  minOrderAmount: (json['minOrderAmount'] as num).toInt(),
  isPercent: json['isPercent'] as bool,
  expiresAt: DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$VoucherToJson(_Voucher instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'title_en': instance.titleEn,
  'title_ur': instance.titleUr,
  'discountAmount': instance.discountAmount,
  'minOrderAmount': instance.minOrderAmount,
  'isPercent': instance.isPercent,
  'expiresAt': instance.expiresAt.toIso8601String(),
};
