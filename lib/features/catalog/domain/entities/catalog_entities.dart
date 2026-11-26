import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_entities.freezed.dart';
part 'catalog_entities.g.dart';

@freezed
abstract class Department with _$Department {
  const Department._();

  const factory Department({
    required String id,
    @JsonKey(name: 'name_en') required String nameEn,
    @JsonKey(name: 'name_ur') required String nameUr,
    required String icon,
    required int sortOrder,
    required bool isActive,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  String localizedName(String langCode) => langCode == 'ur' ? nameUr : nameEn;
}

@freezed
abstract class Category with _$Category {
  const Category._();

  const factory Category({
    required String id,
    required String departmentId,
    String? parentId,
    @JsonKey(name: 'name_en') required String nameEn,
    @JsonKey(name: 'name_ur') required String nameUr,
    required String imageUrl,
    required int sortOrder,
    required bool isActive,
    String? attributeSchemaId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  String localizedName(String langCode) => langCode == 'ur' ? nameUr : nameEn;
}

enum AttributeDisplayType {
  @JsonValue('chip')
  chip,
  @JsonValue('swatch')
  swatch,
  @JsonValue('text')
  text,
}

@freezed
abstract class AttributeValue with _$AttributeValue {
  const AttributeValue._();

  const factory AttributeValue({
    required String value,
    @JsonKey(name: 'label_en') required String labelEn,
    @JsonKey(name: 'label_ur') required String labelUr,
    String? colorHex,
  }) = _AttributeValue;

  factory AttributeValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeValueFromJson(json);

  String localizedLabel(String langCode) =>
      langCode == 'ur' ? labelUr : labelEn;
}

@freezed
abstract class AttributeDefinition with _$AttributeDefinition {
  const AttributeDefinition._();

  const factory AttributeDefinition({
    required String id,
    required String key,
    @JsonKey(name: 'label_en') required String labelEn,
    @JsonKey(name: 'label_ur') required String labelUr,
    required AttributeDisplayType type,
    required List<AttributeValue> values,
  }) = _AttributeDefinition;

  factory AttributeDefinition.fromJson(Map<String, dynamic> json) =>
      _$AttributeDefinitionFromJson(json);

  String localizedLabel(String langCode) =>
      langCode == 'ur' ? labelUr : labelEn;
}

@freezed
abstract class AttributeSchema with _$AttributeSchema {
  const factory AttributeSchema({
    required String id,
    required String name,
    required List<AttributeDefinition> attributes,
  }) = _AttributeSchema;

  factory AttributeSchema.fromJson(Map<String, dynamic> json) =>
      _$AttributeSchemaFromJson(json);
}

@freezed
abstract class ProductVariant with _$ProductVariant {
  const factory ProductVariant({
    required String sku,
    required Map<String, String> options,
    required int price,
    required int stock,
    @Default(<String>[]) List<String> images,
  }) = _ProductVariant;

  factory ProductVariant.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantFromJson(json);
}

@freezed
abstract class Product with _$Product {
  const Product._();

  const factory Product({
    required String id,
    @JsonKey(name: 'title_en') required String titleEn,
    @JsonKey(name: 'title_ur') required String titleUr,
    required String categoryId,
    required String sellerId,
    required List<String> images,
    required int basePrice,
    required int salePrice,
    @Default('PKR') String currency,
    @Default(0.0) double ratingAvg,
    @Default(0) int ratingCount,
    @Default(0) int soldCount,
    @Default(<String, String>{}) Map<String, String> attributes,
    @Default(<ProductVariant>[]) List<ProductVariant> variants,
    @Default('2-4 business days across Pakistan') String deliveryInfo,
    @Default(7) int returnPolicyDays,
    @Default(true) bool codAvailable,
    @Default(true) bool isActive,
    @Default(false) bool isFlashSale,
    String? descriptionEn,
    String? descriptionUr,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  String localizedTitle(String langCode) =>
      langCode == 'ur' ? titleUr : titleEn;

  String localizedDescription(String langCode) =>
      (langCode == 'ur' ? descriptionUr : descriptionEn) ?? '';

  int get effectivePrice => salePrice > 0 ? salePrice : basePrice;

  bool get hasDiscount => salePrice > 0 && salePrice < basePrice;

  int get totalStock =>
      variants.isEmpty ? 10 : variants.fold<int>(0, (sum, v) => sum + v.stock);
}

@freezed
abstract class Seller with _$Seller {
  const factory Seller({
    required String id,
    required String name,
    required String city,
    required double rating,
    @Default(true) bool isVerified,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}

@freezed
abstract class BannerItem with _$BannerItem {
  const BannerItem._();

  const factory BannerItem({
    required String id,
    @JsonKey(name: 'title_en') required String titleEn,
    @JsonKey(name: 'title_ur') required String titleUr,
    @JsonKey(name: 'subtitle_en') required String subtitleEn,
    @JsonKey(name: 'subtitle_ur') required String subtitleUr,
    required String imageUrl,
    required String targetRoute,
    required int sortOrder,
    @Default(true) bool isActive,
  }) = _BannerItem;

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  String localizedTitle(String langCode) =>
      langCode == 'ur' ? titleUr : titleEn;
  String localizedSubtitle(String langCode) =>
      langCode == 'ur' ? subtitleUr : subtitleEn;
}

@freezed
abstract class Voucher with _$Voucher {
  const Voucher._();

  const factory Voucher({
    required String id,
    required String code,
    @JsonKey(name: 'title_en') required String titleEn,
    @JsonKey(name: 'title_ur') required String titleUr,
    required int discountAmount,
    required int minOrderAmount,
    required bool isPercent,
    required DateTime expiresAt,
  }) = _Voucher;

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  String localizedTitle(String langCode) =>
      langCode == 'ur' ? titleUr : titleEn;
}
