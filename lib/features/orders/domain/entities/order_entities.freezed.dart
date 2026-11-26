// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Address {

 String get id; String get fullName; String get phone; String get streetAddress; String get area; String get city; String? get postalCode; bool get isDefault;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Address;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.streetAddress, _this.streetAddress) || other.streetAddress == _this.streetAddress)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.postalCode, _this.postalCode) || other.postalCode == _this.postalCode)&&(identical(other.isDefault, _this.isDefault) || other.isDefault == _this.isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Address;
  return Object.hash(runtimeType,_this.id,_this.fullName,_this.phone,_this.streetAddress,_this.area,_this.city,_this.postalCode,_this.isDefault);
}

@override
String toString() {
  final _this = this as Address;
  return 'Address(id: ${_this.id}, fullName: ${_this.fullName}, phone: ${_this.phone}, streetAddress: ${_this.streetAddress}, area: ${_this.area}, city: ${_this.city}, postalCode: ${_this.postalCode}, isDefault: ${_this.isDefault})';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String phone, String streetAddress, String area, String city, String? postalCode, bool isDefault
});




}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? phone = null,Object? streetAddress = null,Object? area = null,Object? city = null,Object? postalCode = freezed,Object? isDefault = null,}) {
  return _then(Address(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Address value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Address value)  $default,){
final _that = this;
switch (_that) {
case _Address():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Address value)?  $default,){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String phone,  String streetAddress,  String area,  String city,  String? postalCode,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.streetAddress,_that.area,_that.city,_that.postalCode,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String phone,  String streetAddress,  String area,  String city,  String? postalCode,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.id,_that.fullName,_that.phone,_that.streetAddress,_that.area,_that.city,_that.postalCode,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String phone,  String streetAddress,  String area,  String city,  String? postalCode,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.streetAddress,_that.area,_that.city,_that.postalCode,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Address implements Address {
  const _Address({required this.id, required this.fullName, required this.phone, required this.streetAddress, required this.area, required this.city, this.postalCode, this.isDefault = false});
  factory _Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

@override final  String id;
@override final  String fullName;
@override final  String phone;
@override final  String streetAddress;
@override final  String area;
@override final  String city;
@override final  String? postalCode;
@override@JsonKey() final  bool isDefault;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.area, area) || other.area == area)&&(identical(other.city, city) || other.city == city)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,fullName,phone,streetAddress,area,city,postalCode,isDefault);
}

@override
String toString() {
    return 'Address(id: $id, fullName: $fullName, phone: $phone, streetAddress: $streetAddress, area: $area, city: $city, postalCode: $postalCode, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String phone, String streetAddress, String area, String city, String? postalCode, bool isDefault
});




}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? phone = null,Object? streetAddress = null,Object? area = null,Object? city = null,Object? postalCode = freezed,Object? isDefault = null,}) {
  return _then(_Address(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$OrderTimelineStep {

 OrderStatus get status;@JsonKey(name: 'title_en') String get titleEn;@JsonKey(name: 'title_ur') String get titleUr;@JsonKey(name: 'subtitle_en') String get subtitleEn;@JsonKey(name: 'subtitle_ur') String get subtitleUr; DateTime? get timestamp; bool get isCompleted;
/// Create a copy of OrderTimelineStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderTimelineStepCopyWith<OrderTimelineStep> get copyWith => _$OrderTimelineStepCopyWithImpl<OrderTimelineStep>(this as OrderTimelineStep, _$identity);

  /// Serializes this OrderTimelineStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderTimelineStep;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderTimelineStep&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleUr, _this.titleUr) || other.titleUr == _this.titleUr)&&(identical(other.subtitleEn, _this.subtitleEn) || other.subtitleEn == _this.subtitleEn)&&(identical(other.subtitleUr, _this.subtitleUr) || other.subtitleUr == _this.subtitleUr)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp)&&(identical(other.isCompleted, _this.isCompleted) || other.isCompleted == _this.isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderTimelineStep;
  return Object.hash(runtimeType,_this.status,_this.titleEn,_this.titleUr,_this.subtitleEn,_this.subtitleUr,_this.timestamp,_this.isCompleted);
}

@override
String toString() {
  final _this = this as OrderTimelineStep;
  return 'OrderTimelineStep(status: ${_this.status}, titleEn: ${_this.titleEn}, titleUr: ${_this.titleUr}, subtitleEn: ${_this.subtitleEn}, subtitleUr: ${_this.subtitleUr}, timestamp: ${_this.timestamp}, isCompleted: ${_this.isCompleted})';
}


}

/// @nodoc
abstract mixin class $OrderTimelineStepCopyWith<$Res>  {
  factory $OrderTimelineStepCopyWith(OrderTimelineStep value, $Res Function(OrderTimelineStep) _then) = _$OrderTimelineStepCopyWithImpl;
@useResult
$Res call({
 OrderStatus status,@JsonKey(name: 'title_en') String titleEn,@JsonKey(name: 'title_ur') String titleUr,@JsonKey(name: 'subtitle_en') String subtitleEn,@JsonKey(name: 'subtitle_ur') String subtitleUr, DateTime? timestamp, bool isCompleted
});




}
/// @nodoc
class _$OrderTimelineStepCopyWithImpl<$Res>
    implements $OrderTimelineStepCopyWith<$Res> {
  _$OrderTimelineStepCopyWithImpl(this._self, this._then);

  final OrderTimelineStep _self;
  final $Res Function(OrderTimelineStep) _then;

/// Create a copy of OrderTimelineStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? titleEn = null,Object? titleUr = null,Object? subtitleEn = null,Object? subtitleUr = null,Object? timestamp = freezed,Object? isCompleted = null,}) {
  return _then(OrderTimelineStep(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleUr: null == subtitleUr ? _self.subtitleUr : subtitleUr // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderTimelineStep].
extension OrderTimelineStepPatterns on OrderTimelineStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderTimelineStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderTimelineStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderTimelineStep value)  $default,){
final _that = this;
switch (_that) {
case _OrderTimelineStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderTimelineStep value)?  $default,){
final _that = this;
switch (_that) {
case _OrderTimelineStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderStatus status, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr, @JsonKey(name: 'subtitle_en')  String subtitleEn, @JsonKey(name: 'subtitle_ur')  String subtitleUr,  DateTime? timestamp,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderTimelineStep() when $default != null:
return $default(_that.status,_that.titleEn,_that.titleUr,_that.subtitleEn,_that.subtitleUr,_that.timestamp,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderStatus status, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr, @JsonKey(name: 'subtitle_en')  String subtitleEn, @JsonKey(name: 'subtitle_ur')  String subtitleUr,  DateTime? timestamp,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _OrderTimelineStep():
return $default(_that.status,_that.titleEn,_that.titleUr,_that.subtitleEn,_that.subtitleUr,_that.timestamp,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderStatus status, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr, @JsonKey(name: 'subtitle_en')  String subtitleEn, @JsonKey(name: 'subtitle_ur')  String subtitleUr,  DateTime? timestamp,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _OrderTimelineStep() when $default != null:
return $default(_that.status,_that.titleEn,_that.titleUr,_that.subtitleEn,_that.subtitleUr,_that.timestamp,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderTimelineStep extends OrderTimelineStep {
  const _OrderTimelineStep({required this.status, @JsonKey(name: 'title_en') required this.titleEn, @JsonKey(name: 'title_ur') required this.titleUr, @JsonKey(name: 'subtitle_en') required this.subtitleEn, @JsonKey(name: 'subtitle_ur') required this.subtitleUr, this.timestamp, required this.isCompleted}): super._();
  factory _OrderTimelineStep.fromJson(Map<String, dynamic> json) => _$OrderTimelineStepFromJson(json);

@override final  OrderStatus status;
@override@JsonKey(name: 'title_en') final  String titleEn;
@override@JsonKey(name: 'title_ur') final  String titleUr;
@override@JsonKey(name: 'subtitle_en') final  String subtitleEn;
@override@JsonKey(name: 'subtitle_ur') final  String subtitleUr;
@override final  DateTime? timestamp;
@override final  bool isCompleted;

/// Create a copy of OrderTimelineStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderTimelineStepCopyWith<_OrderTimelineStep> get copyWith => __$OrderTimelineStepCopyWithImpl<_OrderTimelineStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderTimelineStepToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderTimelineStep&&(identical(other.status, status) || other.status == status)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleUr, titleUr) || other.titleUr == titleUr)&&(identical(other.subtitleEn, subtitleEn) || other.subtitleEn == subtitleEn)&&(identical(other.subtitleUr, subtitleUr) || other.subtitleUr == subtitleUr)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,titleEn,titleUr,subtitleEn,subtitleUr,timestamp,isCompleted);
}

@override
String toString() {
    return 'OrderTimelineStep(status: $status, titleEn: $titleEn, titleUr: $titleUr, subtitleEn: $subtitleEn, subtitleUr: $subtitleUr, timestamp: $timestamp, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$OrderTimelineStepCopyWith<$Res> implements $OrderTimelineStepCopyWith<$Res> {
  factory _$OrderTimelineStepCopyWith(_OrderTimelineStep value, $Res Function(_OrderTimelineStep) _then) = __$OrderTimelineStepCopyWithImpl;
@override @useResult
$Res call({
 OrderStatus status,@JsonKey(name: 'title_en') String titleEn,@JsonKey(name: 'title_ur') String titleUr,@JsonKey(name: 'subtitle_en') String subtitleEn,@JsonKey(name: 'subtitle_ur') String subtitleUr, DateTime? timestamp, bool isCompleted
});




}
/// @nodoc
class __$OrderTimelineStepCopyWithImpl<$Res>
    implements _$OrderTimelineStepCopyWith<$Res> {
  __$OrderTimelineStepCopyWithImpl(this._self, this._then);

  final _OrderTimelineStep _self;
  final $Res Function(_OrderTimelineStep) _then;

/// Create a copy of OrderTimelineStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? titleEn = null,Object? titleUr = null,Object? subtitleEn = null,Object? subtitleUr = null,Object? timestamp = freezed,Object? isCompleted = null,}) {
  return _then(_OrderTimelineStep(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleUr: null == subtitleUr ? _self.subtitleUr : subtitleUr // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Order {

 String get id; String get userId; List<CartItem> get items; CartTotals get totals; OrderStatus get status; PaymentMethodType get paymentMethod; Address get shippingAddress; List<OrderTimelineStep> get timeline; DateTime get createdAt; String? get trackingNumber; String? get courierName; double? get courierLat; double? get courierLng; double? get destinationLat; double? get destinationLng;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Order;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.totals, _this.totals) || other.totals == _this.totals)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.paymentMethod, _this.paymentMethod) || other.paymentMethod == _this.paymentMethod)&&(identical(other.shippingAddress, _this.shippingAddress) || other.shippingAddress == _this.shippingAddress)&&const DeepCollectionEquality().equals(other.timeline, _this.timeline)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.trackingNumber, _this.trackingNumber) || other.trackingNumber == _this.trackingNumber)&&(identical(other.courierName, _this.courierName) || other.courierName == _this.courierName)&&(identical(other.courierLat, _this.courierLat) || other.courierLat == _this.courierLat)&&(identical(other.courierLng, _this.courierLng) || other.courierLng == _this.courierLng)&&(identical(other.destinationLat, _this.destinationLat) || other.destinationLat == _this.destinationLat)&&(identical(other.destinationLng, _this.destinationLng) || other.destinationLng == _this.destinationLng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Order;
  return Object.hash(runtimeType,_this.id,_this.userId,const DeepCollectionEquality().hash(_this.items),_this.totals,_this.status,_this.paymentMethod,_this.shippingAddress,const DeepCollectionEquality().hash(_this.timeline),_this.createdAt,_this.trackingNumber,_this.courierName,_this.courierLat,_this.courierLng,_this.destinationLat,_this.destinationLng);
}

@override
String toString() {
  final _this = this as Order;
  return 'Order(id: ${_this.id}, userId: ${_this.userId}, items: ${_this.items}, totals: ${_this.totals}, status: ${_this.status}, paymentMethod: ${_this.paymentMethod}, shippingAddress: ${_this.shippingAddress}, timeline: ${_this.timeline}, createdAt: ${_this.createdAt}, trackingNumber: ${_this.trackingNumber}, courierName: ${_this.courierName}, courierLat: ${_this.courierLat}, courierLng: ${_this.courierLng}, destinationLat: ${_this.destinationLat}, destinationLng: ${_this.destinationLng})';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, String userId, List<CartItem> items, CartTotals totals, OrderStatus status, PaymentMethodType paymentMethod, Address shippingAddress, List<OrderTimelineStep> timeline, DateTime createdAt, String? trackingNumber, String? courierName, double? courierLat, double? courierLng, double? destinationLat, double? destinationLng
});


$CartTotalsCopyWith<$Res> get totals;$AddressCopyWith<$Res> get shippingAddress;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? items = null,Object? totals = null,Object? status = null,Object? paymentMethod = null,Object? shippingAddress = null,Object? timeline = null,Object? createdAt = null,Object? trackingNumber = freezed,Object? courierName = freezed,Object? courierLat = freezed,Object? courierLng = freezed,Object? destinationLat = freezed,Object? destinationLng = freezed,}) {
  return _then(Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CartTotals,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Address,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<OrderTimelineStep>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,courierName: freezed == courierName ? _self.courierName : courierName // ignore: cast_nullable_to_non_nullable
as String?,courierLat: freezed == courierLat ? _self.courierLat : courierLat // ignore: cast_nullable_to_non_nullable
as double?,courierLng: freezed == courierLng ? _self.courierLng : courierLng // ignore: cast_nullable_to_non_nullable
as double?,destinationLat: freezed == destinationLat ? _self.destinationLat : destinationLat // ignore: cast_nullable_to_non_nullable
as double?,destinationLng: freezed == destinationLng ? _self.destinationLng : destinationLng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartTotalsCopyWith<$Res> get totals {
  
  return $CartTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get shippingAddress {
  
  return $AddressCopyWith<$Res>(_self.shippingAddress, (value) {
    return _then(_self.copyWith(shippingAddress: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  List<CartItem> items,  CartTotals totals,  OrderStatus status,  PaymentMethodType paymentMethod,  Address shippingAddress,  List<OrderTimelineStep> timeline,  DateTime createdAt,  String? trackingNumber,  String? courierName,  double? courierLat,  double? courierLng,  double? destinationLat,  double? destinationLng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.userId,_that.items,_that.totals,_that.status,_that.paymentMethod,_that.shippingAddress,_that.timeline,_that.createdAt,_that.trackingNumber,_that.courierName,_that.courierLat,_that.courierLng,_that.destinationLat,_that.destinationLng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  List<CartItem> items,  CartTotals totals,  OrderStatus status,  PaymentMethodType paymentMethod,  Address shippingAddress,  List<OrderTimelineStep> timeline,  DateTime createdAt,  String? trackingNumber,  String? courierName,  double? courierLat,  double? courierLng,  double? destinationLat,  double? destinationLng)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.userId,_that.items,_that.totals,_that.status,_that.paymentMethod,_that.shippingAddress,_that.timeline,_that.createdAt,_that.trackingNumber,_that.courierName,_that.courierLat,_that.courierLng,_that.destinationLat,_that.destinationLng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  List<CartItem> items,  CartTotals totals,  OrderStatus status,  PaymentMethodType paymentMethod,  Address shippingAddress,  List<OrderTimelineStep> timeline,  DateTime createdAt,  String? trackingNumber,  String? courierName,  double? courierLat,  double? courierLng,  double? destinationLat,  double? destinationLng)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.userId,_that.items,_that.totals,_that.status,_that.paymentMethod,_that.shippingAddress,_that.timeline,_that.createdAt,_that.trackingNumber,_that.courierName,_that.courierLat,_that.courierLng,_that.destinationLat,_that.destinationLng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({required this.id, required this.userId, required  List<CartItem> items, required this.totals, required this.status, required this.paymentMethod, required this.shippingAddress, required  List<OrderTimelineStep> timeline, required this.createdAt, this.trackingNumber, this.courierName, this.courierLat, this.courierLng, this.destinationLat, this.destinationLng}): _items = items,_timeline = timeline;
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
@override final  String userId;
 final  List<CartItem> _items;
@override List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  CartTotals totals;
@override final  OrderStatus status;
@override final  PaymentMethodType paymentMethod;
@override final  Address shippingAddress;
 final  List<OrderTimelineStep> _timeline;
@override List<OrderTimelineStep> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

@override final  DateTime createdAt;
@override final  String? trackingNumber;
@override final  String? courierName;
@override final  double? courierLat;
@override final  double? courierLng;
@override final  double? destinationLat;
@override final  double? destinationLng;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&const DeepCollectionEquality().equals(other.timeline, _timeline)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.courierName, courierName) || other.courierName == courierName)&&(identical(other.courierLat, courierLat) || other.courierLat == courierLat)&&(identical(other.courierLng, courierLng) || other.courierLng == courierLng)&&(identical(other.destinationLat, destinationLat) || other.destinationLat == destinationLat)&&(identical(other.destinationLng, destinationLng) || other.destinationLng == destinationLng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,const DeepCollectionEquality().hash(_items),totals,status,paymentMethod,shippingAddress,const DeepCollectionEquality().hash(_timeline),createdAt,trackingNumber,courierName,courierLat,courierLng,destinationLat,destinationLng);
}

@override
String toString() {
    return 'Order(id: $id, userId: $userId, items: $items, totals: $totals, status: $status, paymentMethod: $paymentMethod, shippingAddress: $shippingAddress, timeline: $timeline, createdAt: $createdAt, trackingNumber: $trackingNumber, courierName: $courierName, courierLat: $courierLat, courierLng: $courierLng, destinationLat: $destinationLat, destinationLng: $destinationLng)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, List<CartItem> items, CartTotals totals, OrderStatus status, PaymentMethodType paymentMethod, Address shippingAddress, List<OrderTimelineStep> timeline, DateTime createdAt, String? trackingNumber, String? courierName, double? courierLat, double? courierLng, double? destinationLat, double? destinationLng
});


@override $CartTotalsCopyWith<$Res> get totals;@override $AddressCopyWith<$Res> get shippingAddress;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? items = null,Object? totals = null,Object? status = null,Object? paymentMethod = null,Object? shippingAddress = null,Object? timeline = null,Object? createdAt = null,Object? trackingNumber = freezed,Object? courierName = freezed,Object? courierLat = freezed,Object? courierLng = freezed,Object? destinationLat = freezed,Object? destinationLng = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CartTotals,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Address,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<OrderTimelineStep>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,courierName: freezed == courierName ? _self.courierName : courierName // ignore: cast_nullable_to_non_nullable
as String?,courierLat: freezed == courierLat ? _self.courierLat : courierLat // ignore: cast_nullable_to_non_nullable
as double?,courierLng: freezed == courierLng ? _self.courierLng : courierLng // ignore: cast_nullable_to_non_nullable
as double?,destinationLat: freezed == destinationLat ? _self.destinationLat : destinationLat // ignore: cast_nullable_to_non_nullable
as double?,destinationLng: freezed == destinationLng ? _self.destinationLng : destinationLng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartTotalsCopyWith<$Res> get totals {
  
  return $CartTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get shippingAddress {
  
  return $AddressCopyWith<$Res>(_self.shippingAddress, (value) {
    return _then(_self.copyWith(shippingAddress: value));
  });
}
}


/// @nodoc
mixin _$UserProfile {

 String get uid; String get name; String get phone; String? get email; String? get avatarUrl; int get walletBalance; String get language; bool get isGuest;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.uid, _this.uid) || other.uid == _this.uid)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.walletBalance, _this.walletBalance) || other.walletBalance == _this.walletBalance)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.isGuest, _this.isGuest) || other.isGuest == _this.isGuest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserProfile;
  return Object.hash(runtimeType,_this.uid,_this.name,_this.phone,_this.email,_this.avatarUrl,_this.walletBalance,_this.language,_this.isGuest);
}

@override
String toString() {
  final _this = this as UserProfile;
  return 'UserProfile(uid: ${_this.uid}, name: ${_this.name}, phone: ${_this.phone}, email: ${_this.email}, avatarUrl: ${_this.avatarUrl}, walletBalance: ${_this.walletBalance}, language: ${_this.language}, isGuest: ${_this.isGuest})';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String uid, String name, String phone, String? email, String? avatarUrl, int walletBalance, String language, bool isGuest
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? avatarUrl = freezed,Object? walletBalance = null,Object? language = null,Object? isGuest = null,}) {
  return _then(UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,isGuest: null == isGuest ? _self.isGuest : isGuest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String name,  String phone,  String? email,  String? avatarUrl,  int walletBalance,  String language,  bool isGuest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.name,_that.phone,_that.email,_that.avatarUrl,_that.walletBalance,_that.language,_that.isGuest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String name,  String phone,  String? email,  String? avatarUrl,  int walletBalance,  String language,  bool isGuest)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.uid,_that.name,_that.phone,_that.email,_that.avatarUrl,_that.walletBalance,_that.language,_that.isGuest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String name,  String phone,  String? email,  String? avatarUrl,  int walletBalance,  String language,  bool isGuest)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.name,_that.phone,_that.email,_that.avatarUrl,_that.walletBalance,_that.language,_that.isGuest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.uid, required this.name, required this.phone, this.email, this.avatarUrl, this.walletBalance = 0, this.language = 'en', this.isGuest = false});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String uid;
@override final  String name;
@override final  String phone;
@override final  String? email;
@override final  String? avatarUrl;
@override@JsonKey() final  int walletBalance;
@override@JsonKey() final  String language;
@override@JsonKey() final  bool isGuest;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance)&&(identical(other.language, language) || other.language == language)&&(identical(other.isGuest, isGuest) || other.isGuest == isGuest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,uid,name,phone,email,avatarUrl,walletBalance,language,isGuest);
}

@override
String toString() {
    return 'UserProfile(uid: $uid, name: $name, phone: $phone, email: $email, avatarUrl: $avatarUrl, walletBalance: $walletBalance, language: $language, isGuest: $isGuest)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String uid, String name, String phone, String? email, String? avatarUrl, int walletBalance, String language, bool isGuest
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? avatarUrl = freezed,Object? walletBalance = null,Object? language = null,Object? isGuest = null,}) {
  return _then(_UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,isGuest: null == isGuest ? _self.isGuest : isGuest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
