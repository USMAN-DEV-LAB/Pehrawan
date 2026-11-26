// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItem {

 String get id; String get productId; String get sellerId; String get sellerName; String get titleEn; String get titleUr; String get imageUrl; String get sku; Map<String, String> get selectedOptions; int get unitPrice; int get quantity; int get maxStock;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CartItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.sellerId, _this.sellerId) || other.sellerId == _this.sellerId)&&(identical(other.sellerName, _this.sellerName) || other.sellerName == _this.sellerName)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleUr, _this.titleUr) || other.titleUr == _this.titleUr)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&const DeepCollectionEquality().equals(other.selectedOptions, _this.selectedOptions)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.maxStock, _this.maxStock) || other.maxStock == _this.maxStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CartItem;
  return Object.hash(runtimeType,_this.id,_this.productId,_this.sellerId,_this.sellerName,_this.titleEn,_this.titleUr,_this.imageUrl,_this.sku,const DeepCollectionEquality().hash(_this.selectedOptions),_this.unitPrice,_this.quantity,_this.maxStock);
}

@override
String toString() {
  final _this = this as CartItem;
  return 'CartItem(id: ${_this.id}, productId: ${_this.productId}, sellerId: ${_this.sellerId}, sellerName: ${_this.sellerName}, titleEn: ${_this.titleEn}, titleUr: ${_this.titleUr}, imageUrl: ${_this.imageUrl}, sku: ${_this.sku}, selectedOptions: ${_this.selectedOptions}, unitPrice: ${_this.unitPrice}, quantity: ${_this.quantity}, maxStock: ${_this.maxStock})';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
 String id, String productId, String sellerId, String sellerName, String titleEn, String titleUr, String imageUrl, String sku, Map<String, String> selectedOptions, int unitPrice, int quantity, int maxStock
});




}
/// @nodoc
class _$CartItemCopyWithImpl<$Res>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._self, this._then);

  final CartItem _self;
  final $Res Function(CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? sellerId = null,Object? sellerName = null,Object? titleEn = null,Object? titleUr = null,Object? imageUrl = null,Object? sku = null,Object? selectedOptions = null,Object? unitPrice = null,Object? quantity = null,Object? maxStock = null,}) {
  return _then(CartItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,selectedOptions: null == selectedOptions ? _self.selectedOptions : selectedOptions // ignore: cast_nullable_to_non_nullable
as Map<String, String>,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,maxStock: null == maxStock ? _self.maxStock : maxStock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CartItem].
extension CartItemPatterns on CartItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItem value)  $default,){
final _that = this;
switch (_that) {
case _CartItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  String sellerId,  String sellerName,  String titleEn,  String titleUr,  String imageUrl,  String sku,  Map<String, String> selectedOptions,  int unitPrice,  int quantity,  int maxStock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.productId,_that.sellerId,_that.sellerName,_that.titleEn,_that.titleUr,_that.imageUrl,_that.sku,_that.selectedOptions,_that.unitPrice,_that.quantity,_that.maxStock);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  String sellerId,  String sellerName,  String titleEn,  String titleUr,  String imageUrl,  String sku,  Map<String, String> selectedOptions,  int unitPrice,  int quantity,  int maxStock)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
return $default(_that.id,_that.productId,_that.sellerId,_that.sellerName,_that.titleEn,_that.titleUr,_that.imageUrl,_that.sku,_that.selectedOptions,_that.unitPrice,_that.quantity,_that.maxStock);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  String sellerId,  String sellerName,  String titleEn,  String titleUr,  String imageUrl,  String sku,  Map<String, String> selectedOptions,  int unitPrice,  int quantity,  int maxStock)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.productId,_that.sellerId,_that.sellerName,_that.titleEn,_that.titleUr,_that.imageUrl,_that.sku,_that.selectedOptions,_that.unitPrice,_that.quantity,_that.maxStock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItem extends CartItem {
  const _CartItem({required this.id, required this.productId, required this.sellerId, required this.sellerName, required this.titleEn, required this.titleUr, required this.imageUrl, required this.sku, required  Map<String, String> selectedOptions, required this.unitPrice, required this.quantity, this.maxStock = 10}): _selectedOptions = selectedOptions,super._();
  factory _CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

@override final  String id;
@override final  String productId;
@override final  String sellerId;
@override final  String sellerName;
@override final  String titleEn;
@override final  String titleUr;
@override final  String imageUrl;
@override final  String sku;
 final  Map<String, String> _selectedOptions;
@override Map<String, String> get selectedOptions {
  if (_selectedOptions is EqualUnmodifiableMapView) return _selectedOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectedOptions);
}

@override final  int unitPrice;
@override final  int quantity;
@override@JsonKey() final  int maxStock;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemCopyWith<_CartItem> get copyWith => __$CartItemCopyWithImpl<_CartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleUr, titleUr) || other.titleUr == titleUr)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.sku, sku) || other.sku == sku)&&const DeepCollectionEquality().equals(other.selectedOptions, _selectedOptions)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.maxStock, maxStock) || other.maxStock == maxStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,productId,sellerId,sellerName,titleEn,titleUr,imageUrl,sku,const DeepCollectionEquality().hash(_selectedOptions),unitPrice,quantity,maxStock);
}

@override
String toString() {
    return 'CartItem(id: $id, productId: $productId, sellerId: $sellerId, sellerName: $sellerName, titleEn: $titleEn, titleUr: $titleUr, imageUrl: $imageUrl, sku: $sku, selectedOptions: $selectedOptions, unitPrice: $unitPrice, quantity: $quantity, maxStock: $maxStock)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, String sellerId, String sellerName, String titleEn, String titleUr, String imageUrl, String sku, Map<String, String> selectedOptions, int unitPrice, int quantity, int maxStock
});




}
/// @nodoc
class __$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(this._self, this._then);

  final _CartItem _self;
  final $Res Function(_CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? sellerId = null,Object? sellerName = null,Object? titleEn = null,Object? titleUr = null,Object? imageUrl = null,Object? sku = null,Object? selectedOptions = null,Object? unitPrice = null,Object? quantity = null,Object? maxStock = null,}) {
  return _then(_CartItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,selectedOptions: null == selectedOptions ? _self._selectedOptions : selectedOptions // ignore: cast_nullable_to_non_nullable
as Map<String, String>,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,maxStock: null == maxStock ? _self.maxStock : maxStock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CartTotals {

 int get subtotal; int get discount; int get deliveryFee; int get total; int get itemCount;
/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartTotalsCopyWith<CartTotals> get copyWith => _$CartTotalsCopyWithImpl<CartTotals>(this as CartTotals, _$identity);

  /// Serializes this CartTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CartTotals;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartTotals&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal)&&(identical(other.discount, _this.discount) || other.discount == _this.discount)&&(identical(other.deliveryFee, _this.deliveryFee) || other.deliveryFee == _this.deliveryFee)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CartTotals;
  return Object.hash(runtimeType,_this.subtotal,_this.discount,_this.deliveryFee,_this.total,_this.itemCount);
}

@override
String toString() {
  final _this = this as CartTotals;
  return 'CartTotals(subtotal: ${_this.subtotal}, discount: ${_this.discount}, deliveryFee: ${_this.deliveryFee}, total: ${_this.total}, itemCount: ${_this.itemCount})';
}


}

/// @nodoc
abstract mixin class $CartTotalsCopyWith<$Res>  {
  factory $CartTotalsCopyWith(CartTotals value, $Res Function(CartTotals) _then) = _$CartTotalsCopyWithImpl;
@useResult
$Res call({
 int subtotal, int discount, int deliveryFee, int total, int itemCount
});




}
/// @nodoc
class _$CartTotalsCopyWithImpl<$Res>
    implements $CartTotalsCopyWith<$Res> {
  _$CartTotalsCopyWithImpl(this._self, this._then);

  final CartTotals _self;
  final $Res Function(CartTotals) _then;

/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtotal = null,Object? discount = null,Object? deliveryFee = null,Object? total = null,Object? itemCount = null,}) {
  return _then(CartTotals(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CartTotals].
extension CartTotalsPatterns on CartTotals {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartTotals value)  $default,){
final _that = this;
switch (_that) {
case _CartTotals():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartTotals value)?  $default,){
final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int subtotal,  int discount,  int deliveryFee,  int total,  int itemCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.deliveryFee,_that.total,_that.itemCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int subtotal,  int discount,  int deliveryFee,  int total,  int itemCount)  $default,) {final _that = this;
switch (_that) {
case _CartTotals():
return $default(_that.subtotal,_that.discount,_that.deliveryFee,_that.total,_that.itemCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int subtotal,  int discount,  int deliveryFee,  int total,  int itemCount)?  $default,) {final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.deliveryFee,_that.total,_that.itemCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartTotals extends CartTotals {
  const _CartTotals({required this.subtotal, required this.discount, required this.deliveryFee, required this.total, required this.itemCount}): super._();
  factory _CartTotals.fromJson(Map<String, dynamic> json) => _$CartTotalsFromJson(json);

@override final  int subtotal;
@override final  int discount;
@override final  int deliveryFee;
@override final  int total;
@override final  int itemCount;

/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartTotalsCopyWith<_CartTotals> get copyWith => __$CartTotalsCopyWithImpl<_CartTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,subtotal,discount,deliveryFee,total,itemCount);
}

@override
String toString() {
    return 'CartTotals(subtotal: $subtotal, discount: $discount, deliveryFee: $deliveryFee, total: $total, itemCount: $itemCount)';
}


}

/// @nodoc
abstract mixin class _$CartTotalsCopyWith<$Res> implements $CartTotalsCopyWith<$Res> {
  factory _$CartTotalsCopyWith(_CartTotals value, $Res Function(_CartTotals) _then) = __$CartTotalsCopyWithImpl;
@override @useResult
$Res call({
 int subtotal, int discount, int deliveryFee, int total, int itemCount
});




}
/// @nodoc
class __$CartTotalsCopyWithImpl<$Res>
    implements _$CartTotalsCopyWith<$Res> {
  __$CartTotalsCopyWithImpl(this._self, this._then);

  final _CartTotals _self;
  final $Res Function(_CartTotals) _then;

/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtotal = null,Object? discount = null,Object? deliveryFee = null,Object? total = null,Object? itemCount = null,}) {
  return _then(_CartTotals(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
