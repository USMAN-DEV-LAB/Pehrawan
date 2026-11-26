// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Department {

 String get id;@JsonKey(name: 'name_en') String get nameEn;@JsonKey(name: 'name_ur') String get nameUr; String get icon; int get sortOrder; bool get isActive;
/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentCopyWith<Department> get copyWith => _$DepartmentCopyWithImpl<Department>(this as Department, _$identity);

  /// Serializes this Department to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Department;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Department&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.nameEn, _this.nameEn) || other.nameEn == _this.nameEn)&&(identical(other.nameUr, _this.nameUr) || other.nameUr == _this.nameUr)&&(identical(other.icon, _this.icon) || other.icon == _this.icon)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Department;
  return Object.hash(runtimeType,_this.id,_this.nameEn,_this.nameUr,_this.icon,_this.sortOrder,_this.isActive);
}

@override
String toString() {
  final _this = this as Department;
  return 'Department(id: ${_this.id}, nameEn: ${_this.nameEn}, nameUr: ${_this.nameUr}, icon: ${_this.icon}, sortOrder: ${_this.sortOrder}, isActive: ${_this.isActive})';
}


}

/// @nodoc
abstract mixin class $DepartmentCopyWith<$Res>  {
  factory $DepartmentCopyWith(Department value, $Res Function(Department) _then) = _$DepartmentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'name_en') String nameEn,@JsonKey(name: 'name_ur') String nameUr, String icon, int sortOrder, bool isActive
});




}
/// @nodoc
class _$DepartmentCopyWithImpl<$Res>
    implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._self, this._then);

  final Department _self;
  final $Res Function(Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nameEn = null,Object? nameUr = null,Object? icon = null,Object? sortOrder = null,Object? isActive = null,}) {
  return _then(Department(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameUr: null == nameUr ? _self.nameUr : nameUr // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Department].
extension DepartmentPatterns on Department {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Department value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Department() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Department value)  $default,){
final _that = this;
switch (_that) {
case _Department():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Department value)?  $default,){
final _that = this;
switch (_that) {
case _Department() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'name_en')  String nameEn, @JsonKey(name: 'name_ur')  String nameUr,  String icon,  int sortOrder,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that.id,_that.nameEn,_that.nameUr,_that.icon,_that.sortOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'name_en')  String nameEn, @JsonKey(name: 'name_ur')  String nameUr,  String icon,  int sortOrder,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _Department():
return $default(_that.id,_that.nameEn,_that.nameUr,_that.icon,_that.sortOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'name_en')  String nameEn, @JsonKey(name: 'name_ur')  String nameUr,  String icon,  int sortOrder,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that.id,_that.nameEn,_that.nameUr,_that.icon,_that.sortOrder,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Department extends Department {
  const _Department({required this.id, @JsonKey(name: 'name_en') required this.nameEn, @JsonKey(name: 'name_ur') required this.nameUr, required this.icon, required this.sortOrder, required this.isActive}): super._();
  factory _Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

@override final  String id;
@override@JsonKey(name: 'name_en') final  String nameEn;
@override@JsonKey(name: 'name_ur') final  String nameUr;
@override final  String icon;
@override final  int sortOrder;
@override final  bool isActive;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentCopyWith<_Department> get copyWith => __$DepartmentCopyWithImpl<_Department>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Department&&(identical(other.id, id) || other.id == id)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameUr, nameUr) || other.nameUr == nameUr)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,nameEn,nameUr,icon,sortOrder,isActive);
}

@override
String toString() {
    return 'Department(id: $id, nameEn: $nameEn, nameUr: $nameUr, icon: $icon, sortOrder: $sortOrder, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$DepartmentCopyWith<$Res> implements $DepartmentCopyWith<$Res> {
  factory _$DepartmentCopyWith(_Department value, $Res Function(_Department) _then) = __$DepartmentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'name_en') String nameEn,@JsonKey(name: 'name_ur') String nameUr, String icon, int sortOrder, bool isActive
});




}
/// @nodoc
class __$DepartmentCopyWithImpl<$Res>
    implements _$DepartmentCopyWith<$Res> {
  __$DepartmentCopyWithImpl(this._self, this._then);

  final _Department _self;
  final $Res Function(_Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nameEn = null,Object? nameUr = null,Object? icon = null,Object? sortOrder = null,Object? isActive = null,}) {
  return _then(_Department(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameUr: null == nameUr ? _self.nameUr : nameUr // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Category {

 String get id; String get departmentId; String? get parentId;@JsonKey(name: 'name_en') String get nameEn;@JsonKey(name: 'name_ur') String get nameUr; String get imageUrl; int get sortOrder; bool get isActive; String? get attributeSchemaId;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Category;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.departmentId, _this.departmentId) || other.departmentId == _this.departmentId)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&(identical(other.nameEn, _this.nameEn) || other.nameEn == _this.nameEn)&&(identical(other.nameUr, _this.nameUr) || other.nameUr == _this.nameUr)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.attributeSchemaId, _this.attributeSchemaId) || other.attributeSchemaId == _this.attributeSchemaId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Category;
  return Object.hash(runtimeType,_this.id,_this.departmentId,_this.parentId,_this.nameEn,_this.nameUr,_this.imageUrl,_this.sortOrder,_this.isActive,_this.attributeSchemaId);
}

@override
String toString() {
  final _this = this as Category;
  return 'Category(id: ${_this.id}, departmentId: ${_this.departmentId}, parentId: ${_this.parentId}, nameEn: ${_this.nameEn}, nameUr: ${_this.nameUr}, imageUrl: ${_this.imageUrl}, sortOrder: ${_this.sortOrder}, isActive: ${_this.isActive}, attributeSchemaId: ${_this.attributeSchemaId})';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 String id, String departmentId, String? parentId,@JsonKey(name: 'name_en') String nameEn,@JsonKey(name: 'name_ur') String nameUr, String imageUrl, int sortOrder, bool isActive, String? attributeSchemaId
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? departmentId = null,Object? parentId = freezed,Object? nameEn = null,Object? nameUr = null,Object? imageUrl = null,Object? sortOrder = null,Object? isActive = null,Object? attributeSchemaId = freezed,}) {
  return _then(Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameUr: null == nameUr ? _self.nameUr : nameUr // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,attributeSchemaId: freezed == attributeSchemaId ? _self.attributeSchemaId : attributeSchemaId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String departmentId,  String? parentId, @JsonKey(name: 'name_en')  String nameEn, @JsonKey(name: 'name_ur')  String nameUr,  String imageUrl,  int sortOrder,  bool isActive,  String? attributeSchemaId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.departmentId,_that.parentId,_that.nameEn,_that.nameUr,_that.imageUrl,_that.sortOrder,_that.isActive,_that.attributeSchemaId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String departmentId,  String? parentId, @JsonKey(name: 'name_en')  String nameEn, @JsonKey(name: 'name_ur')  String nameUr,  String imageUrl,  int sortOrder,  bool isActive,  String? attributeSchemaId)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.departmentId,_that.parentId,_that.nameEn,_that.nameUr,_that.imageUrl,_that.sortOrder,_that.isActive,_that.attributeSchemaId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String departmentId,  String? parentId, @JsonKey(name: 'name_en')  String nameEn, @JsonKey(name: 'name_ur')  String nameUr,  String imageUrl,  int sortOrder,  bool isActive,  String? attributeSchemaId)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.departmentId,_that.parentId,_that.nameEn,_that.nameUr,_that.imageUrl,_that.sortOrder,_that.isActive,_that.attributeSchemaId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category extends Category {
  const _Category({required this.id, required this.departmentId, this.parentId, @JsonKey(name: 'name_en') required this.nameEn, @JsonKey(name: 'name_ur') required this.nameUr, required this.imageUrl, required this.sortOrder, required this.isActive, this.attributeSchemaId}): super._();
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override final  String id;
@override final  String departmentId;
@override final  String? parentId;
@override@JsonKey(name: 'name_en') final  String nameEn;
@override@JsonKey(name: 'name_ur') final  String nameUr;
@override final  String imageUrl;
@override final  int sortOrder;
@override final  bool isActive;
@override final  String? attributeSchemaId;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameUr, nameUr) || other.nameUr == nameUr)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.attributeSchemaId, attributeSchemaId) || other.attributeSchemaId == attributeSchemaId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,departmentId,parentId,nameEn,nameUr,imageUrl,sortOrder,isActive,attributeSchemaId);
}

@override
String toString() {
    return 'Category(id: $id, departmentId: $departmentId, parentId: $parentId, nameEn: $nameEn, nameUr: $nameUr, imageUrl: $imageUrl, sortOrder: $sortOrder, isActive: $isActive, attributeSchemaId: $attributeSchemaId)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String departmentId, String? parentId,@JsonKey(name: 'name_en') String nameEn,@JsonKey(name: 'name_ur') String nameUr, String imageUrl, int sortOrder, bool isActive, String? attributeSchemaId
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? departmentId = null,Object? parentId = freezed,Object? nameEn = null,Object? nameUr = null,Object? imageUrl = null,Object? sortOrder = null,Object? isActive = null,Object? attributeSchemaId = freezed,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,nameUr: null == nameUr ? _self.nameUr : nameUr // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,attributeSchemaId: freezed == attributeSchemaId ? _self.attributeSchemaId : attributeSchemaId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AttributeValue {

 String get value;@JsonKey(name: 'label_en') String get labelEn;@JsonKey(name: 'label_ur') String get labelUr; String? get colorHex;
/// Create a copy of AttributeValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributeValueCopyWith<AttributeValue> get copyWith => _$AttributeValueCopyWithImpl<AttributeValue>(this as AttributeValue, _$identity);

  /// Serializes this AttributeValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttributeValue;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeValue&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.labelEn, _this.labelEn) || other.labelEn == _this.labelEn)&&(identical(other.labelUr, _this.labelUr) || other.labelUr == _this.labelUr)&&(identical(other.colorHex, _this.colorHex) || other.colorHex == _this.colorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttributeValue;
  return Object.hash(runtimeType,_this.value,_this.labelEn,_this.labelUr,_this.colorHex);
}

@override
String toString() {
  final _this = this as AttributeValue;
  return 'AttributeValue(value: ${_this.value}, labelEn: ${_this.labelEn}, labelUr: ${_this.labelUr}, colorHex: ${_this.colorHex})';
}


}

/// @nodoc
abstract mixin class $AttributeValueCopyWith<$Res>  {
  factory $AttributeValueCopyWith(AttributeValue value, $Res Function(AttributeValue) _then) = _$AttributeValueCopyWithImpl;
@useResult
$Res call({
 String value,@JsonKey(name: 'label_en') String labelEn,@JsonKey(name: 'label_ur') String labelUr, String? colorHex
});




}
/// @nodoc
class _$AttributeValueCopyWithImpl<$Res>
    implements $AttributeValueCopyWith<$Res> {
  _$AttributeValueCopyWithImpl(this._self, this._then);

  final AttributeValue _self;
  final $Res Function(AttributeValue) _then;

/// Create a copy of AttributeValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? labelEn = null,Object? labelUr = null,Object? colorHex = freezed,}) {
  return _then(AttributeValue(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,labelEn: null == labelEn ? _self.labelEn : labelEn // ignore: cast_nullable_to_non_nullable
as String,labelUr: null == labelUr ? _self.labelUr : labelUr // ignore: cast_nullable_to_non_nullable
as String,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttributeValue].
extension AttributeValuePatterns on AttributeValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttributeValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttributeValue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttributeValue value)  $default,){
final _that = this;
switch (_that) {
case _AttributeValue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttributeValue value)?  $default,){
final _that = this;
switch (_that) {
case _AttributeValue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value, @JsonKey(name: 'label_en')  String labelEn, @JsonKey(name: 'label_ur')  String labelUr,  String? colorHex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttributeValue() when $default != null:
return $default(_that.value,_that.labelEn,_that.labelUr,_that.colorHex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value, @JsonKey(name: 'label_en')  String labelEn, @JsonKey(name: 'label_ur')  String labelUr,  String? colorHex)  $default,) {final _that = this;
switch (_that) {
case _AttributeValue():
return $default(_that.value,_that.labelEn,_that.labelUr,_that.colorHex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value, @JsonKey(name: 'label_en')  String labelEn, @JsonKey(name: 'label_ur')  String labelUr,  String? colorHex)?  $default,) {final _that = this;
switch (_that) {
case _AttributeValue() when $default != null:
return $default(_that.value,_that.labelEn,_that.labelUr,_that.colorHex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttributeValue extends AttributeValue {
  const _AttributeValue({required this.value, @JsonKey(name: 'label_en') required this.labelEn, @JsonKey(name: 'label_ur') required this.labelUr, this.colorHex}): super._();
  factory _AttributeValue.fromJson(Map<String, dynamic> json) => _$AttributeValueFromJson(json);

@override final  String value;
@override@JsonKey(name: 'label_en') final  String labelEn;
@override@JsonKey(name: 'label_ur') final  String labelUr;
@override final  String? colorHex;

/// Create a copy of AttributeValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttributeValueCopyWith<_AttributeValue> get copyWith => __$AttributeValueCopyWithImpl<_AttributeValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttributeValueToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttributeValue&&(identical(other.value, value) || other.value == value)&&(identical(other.labelEn, labelEn) || other.labelEn == labelEn)&&(identical(other.labelUr, labelUr) || other.labelUr == labelUr)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,value,labelEn,labelUr,colorHex);
}

@override
String toString() {
    return 'AttributeValue(value: $value, labelEn: $labelEn, labelUr: $labelUr, colorHex: $colorHex)';
}


}

/// @nodoc
abstract mixin class _$AttributeValueCopyWith<$Res> implements $AttributeValueCopyWith<$Res> {
  factory _$AttributeValueCopyWith(_AttributeValue value, $Res Function(_AttributeValue) _then) = __$AttributeValueCopyWithImpl;
@override @useResult
$Res call({
 String value,@JsonKey(name: 'label_en') String labelEn,@JsonKey(name: 'label_ur') String labelUr, String? colorHex
});




}
/// @nodoc
class __$AttributeValueCopyWithImpl<$Res>
    implements _$AttributeValueCopyWith<$Res> {
  __$AttributeValueCopyWithImpl(this._self, this._then);

  final _AttributeValue _self;
  final $Res Function(_AttributeValue) _then;

/// Create a copy of AttributeValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? labelEn = null,Object? labelUr = null,Object? colorHex = freezed,}) {
  return _then(_AttributeValue(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,labelEn: null == labelEn ? _self.labelEn : labelEn // ignore: cast_nullable_to_non_nullable
as String,labelUr: null == labelUr ? _self.labelUr : labelUr // ignore: cast_nullable_to_non_nullable
as String,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AttributeDefinition {

 String get id; String get key;@JsonKey(name: 'label_en') String get labelEn;@JsonKey(name: 'label_ur') String get labelUr; AttributeDisplayType get type; List<AttributeValue> get values;
/// Create a copy of AttributeDefinition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributeDefinitionCopyWith<AttributeDefinition> get copyWith => _$AttributeDefinitionCopyWithImpl<AttributeDefinition>(this as AttributeDefinition, _$identity);

  /// Serializes this AttributeDefinition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttributeDefinition;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeDefinition&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.labelEn, _this.labelEn) || other.labelEn == _this.labelEn)&&(identical(other.labelUr, _this.labelUr) || other.labelUr == _this.labelUr)&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.values, _this.values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttributeDefinition;
  return Object.hash(runtimeType,_this.id,_this.key,_this.labelEn,_this.labelUr,_this.type,const DeepCollectionEquality().hash(_this.values));
}

@override
String toString() {
  final _this = this as AttributeDefinition;
  return 'AttributeDefinition(id: ${_this.id}, key: ${_this.key}, labelEn: ${_this.labelEn}, labelUr: ${_this.labelUr}, type: ${_this.type}, values: ${_this.values})';
}


}

/// @nodoc
abstract mixin class $AttributeDefinitionCopyWith<$Res>  {
  factory $AttributeDefinitionCopyWith(AttributeDefinition value, $Res Function(AttributeDefinition) _then) = _$AttributeDefinitionCopyWithImpl;
@useResult
$Res call({
 String id, String key,@JsonKey(name: 'label_en') String labelEn,@JsonKey(name: 'label_ur') String labelUr, AttributeDisplayType type, List<AttributeValue> values
});




}
/// @nodoc
class _$AttributeDefinitionCopyWithImpl<$Res>
    implements $AttributeDefinitionCopyWith<$Res> {
  _$AttributeDefinitionCopyWithImpl(this._self, this._then);

  final AttributeDefinition _self;
  final $Res Function(AttributeDefinition) _then;

/// Create a copy of AttributeDefinition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? key = null,Object? labelEn = null,Object? labelUr = null,Object? type = null,Object? values = null,}) {
  return _then(AttributeDefinition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,labelEn: null == labelEn ? _self.labelEn : labelEn // ignore: cast_nullable_to_non_nullable
as String,labelUr: null == labelUr ? _self.labelUr : labelUr // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AttributeDisplayType,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<AttributeValue>,
  ));
}

}


/// Adds pattern-matching-related methods to [AttributeDefinition].
extension AttributeDefinitionPatterns on AttributeDefinition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttributeDefinition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttributeDefinition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttributeDefinition value)  $default,){
final _that = this;
switch (_that) {
case _AttributeDefinition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttributeDefinition value)?  $default,){
final _that = this;
switch (_that) {
case _AttributeDefinition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String key, @JsonKey(name: 'label_en')  String labelEn, @JsonKey(name: 'label_ur')  String labelUr,  AttributeDisplayType type,  List<AttributeValue> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttributeDefinition() when $default != null:
return $default(_that.id,_that.key,_that.labelEn,_that.labelUr,_that.type,_that.values);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String key, @JsonKey(name: 'label_en')  String labelEn, @JsonKey(name: 'label_ur')  String labelUr,  AttributeDisplayType type,  List<AttributeValue> values)  $default,) {final _that = this;
switch (_that) {
case _AttributeDefinition():
return $default(_that.id,_that.key,_that.labelEn,_that.labelUr,_that.type,_that.values);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String key, @JsonKey(name: 'label_en')  String labelEn, @JsonKey(name: 'label_ur')  String labelUr,  AttributeDisplayType type,  List<AttributeValue> values)?  $default,) {final _that = this;
switch (_that) {
case _AttributeDefinition() when $default != null:
return $default(_that.id,_that.key,_that.labelEn,_that.labelUr,_that.type,_that.values);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttributeDefinition extends AttributeDefinition {
  const _AttributeDefinition({required this.id, required this.key, @JsonKey(name: 'label_en') required this.labelEn, @JsonKey(name: 'label_ur') required this.labelUr, required this.type, required  List<AttributeValue> values}): _values = values,super._();
  factory _AttributeDefinition.fromJson(Map<String, dynamic> json) => _$AttributeDefinitionFromJson(json);

@override final  String id;
@override final  String key;
@override@JsonKey(name: 'label_en') final  String labelEn;
@override@JsonKey(name: 'label_ur') final  String labelUr;
@override final  AttributeDisplayType type;
 final  List<AttributeValue> _values;
@override List<AttributeValue> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}


/// Create a copy of AttributeDefinition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttributeDefinitionCopyWith<_AttributeDefinition> get copyWith => __$AttributeDefinitionCopyWithImpl<_AttributeDefinition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttributeDefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttributeDefinition&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.labelEn, labelEn) || other.labelEn == labelEn)&&(identical(other.labelUr, labelUr) || other.labelUr == labelUr)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.values, _values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,key,labelEn,labelUr,type,const DeepCollectionEquality().hash(_values));
}

@override
String toString() {
    return 'AttributeDefinition(id: $id, key: $key, labelEn: $labelEn, labelUr: $labelUr, type: $type, values: $values)';
}


}

/// @nodoc
abstract mixin class _$AttributeDefinitionCopyWith<$Res> implements $AttributeDefinitionCopyWith<$Res> {
  factory _$AttributeDefinitionCopyWith(_AttributeDefinition value, $Res Function(_AttributeDefinition) _then) = __$AttributeDefinitionCopyWithImpl;
@override @useResult
$Res call({
 String id, String key,@JsonKey(name: 'label_en') String labelEn,@JsonKey(name: 'label_ur') String labelUr, AttributeDisplayType type, List<AttributeValue> values
});




}
/// @nodoc
class __$AttributeDefinitionCopyWithImpl<$Res>
    implements _$AttributeDefinitionCopyWith<$Res> {
  __$AttributeDefinitionCopyWithImpl(this._self, this._then);

  final _AttributeDefinition _self;
  final $Res Function(_AttributeDefinition) _then;

/// Create a copy of AttributeDefinition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? key = null,Object? labelEn = null,Object? labelUr = null,Object? type = null,Object? values = null,}) {
  return _then(_AttributeDefinition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,labelEn: null == labelEn ? _self.labelEn : labelEn // ignore: cast_nullable_to_non_nullable
as String,labelUr: null == labelUr ? _self.labelUr : labelUr // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AttributeDisplayType,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<AttributeValue>,
  ));
}


}


/// @nodoc
mixin _$AttributeSchema {

 String get id; String get name; List<AttributeDefinition> get attributes;
/// Create a copy of AttributeSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributeSchemaCopyWith<AttributeSchema> get copyWith => _$AttributeSchemaCopyWithImpl<AttributeSchema>(this as AttributeSchema, _$identity);

  /// Serializes this AttributeSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttributeSchema;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeSchema&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.attributes, _this.attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttributeSchema;
  return Object.hash(runtimeType,_this.id,_this.name,const DeepCollectionEquality().hash(_this.attributes));
}

@override
String toString() {
  final _this = this as AttributeSchema;
  return 'AttributeSchema(id: ${_this.id}, name: ${_this.name}, attributes: ${_this.attributes})';
}


}

/// @nodoc
abstract mixin class $AttributeSchemaCopyWith<$Res>  {
  factory $AttributeSchemaCopyWith(AttributeSchema value, $Res Function(AttributeSchema) _then) = _$AttributeSchemaCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<AttributeDefinition> attributes
});




}
/// @nodoc
class _$AttributeSchemaCopyWithImpl<$Res>
    implements $AttributeSchemaCopyWith<$Res> {
  _$AttributeSchemaCopyWithImpl(this._self, this._then);

  final AttributeSchema _self;
  final $Res Function(AttributeSchema) _then;

/// Create a copy of AttributeSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? attributes = null,}) {
  return _then(AttributeSchema(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<AttributeDefinition>,
  ));
}

}


/// Adds pattern-matching-related methods to [AttributeSchema].
extension AttributeSchemaPatterns on AttributeSchema {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttributeSchema value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttributeSchema() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttributeSchema value)  $default,){
final _that = this;
switch (_that) {
case _AttributeSchema():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttributeSchema value)?  $default,){
final _that = this;
switch (_that) {
case _AttributeSchema() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<AttributeDefinition> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttributeSchema() when $default != null:
return $default(_that.id,_that.name,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<AttributeDefinition> attributes)  $default,) {final _that = this;
switch (_that) {
case _AttributeSchema():
return $default(_that.id,_that.name,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<AttributeDefinition> attributes)?  $default,) {final _that = this;
switch (_that) {
case _AttributeSchema() when $default != null:
return $default(_that.id,_that.name,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttributeSchema implements AttributeSchema {
  const _AttributeSchema({required this.id, required this.name, required  List<AttributeDefinition> attributes}): _attributes = attributes;
  factory _AttributeSchema.fromJson(Map<String, dynamic> json) => _$AttributeSchemaFromJson(json);

@override final  String id;
@override final  String name;
 final  List<AttributeDefinition> _attributes;
@override List<AttributeDefinition> get attributes {
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attributes);
}


/// Create a copy of AttributeSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttributeSchemaCopyWith<_AttributeSchema> get copyWith => __$AttributeSchemaCopyWithImpl<_AttributeSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttributeSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttributeSchema&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_attributes));
}

@override
String toString() {
    return 'AttributeSchema(id: $id, name: $name, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$AttributeSchemaCopyWith<$Res> implements $AttributeSchemaCopyWith<$Res> {
  factory _$AttributeSchemaCopyWith(_AttributeSchema value, $Res Function(_AttributeSchema) _then) = __$AttributeSchemaCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<AttributeDefinition> attributes
});




}
/// @nodoc
class __$AttributeSchemaCopyWithImpl<$Res>
    implements _$AttributeSchemaCopyWith<$Res> {
  __$AttributeSchemaCopyWithImpl(this._self, this._then);

  final _AttributeSchema _self;
  final $Res Function(_AttributeSchema) _then;

/// Create a copy of AttributeSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? attributes = null,}) {
  return _then(_AttributeSchema(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<AttributeDefinition>,
  ));
}


}


/// @nodoc
mixin _$ProductVariant {

 String get sku; Map<String, String> get options; int get price; int get stock; List<String> get images;
/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductVariantCopyWith<ProductVariant> get copyWith => _$ProductVariantCopyWithImpl<ProductVariant>(this as ProductVariant, _$identity);

  /// Serializes this ProductVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductVariant;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductVariant&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&const DeepCollectionEquality().equals(other.options, _this.options)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&const DeepCollectionEquality().equals(other.images, _this.images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductVariant;
  return Object.hash(runtimeType,_this.sku,const DeepCollectionEquality().hash(_this.options),_this.price,_this.stock,const DeepCollectionEquality().hash(_this.images));
}

@override
String toString() {
  final _this = this as ProductVariant;
  return 'ProductVariant(sku: ${_this.sku}, options: ${_this.options}, price: ${_this.price}, stock: ${_this.stock}, images: ${_this.images})';
}


}

/// @nodoc
abstract mixin class $ProductVariantCopyWith<$Res>  {
  factory $ProductVariantCopyWith(ProductVariant value, $Res Function(ProductVariant) _then) = _$ProductVariantCopyWithImpl;
@useResult
$Res call({
 String sku, Map<String, String> options, int price, int stock, List<String> images
});




}
/// @nodoc
class _$ProductVariantCopyWithImpl<$Res>
    implements $ProductVariantCopyWith<$Res> {
  _$ProductVariantCopyWithImpl(this._self, this._then);

  final ProductVariant _self;
  final $Res Function(ProductVariant) _then;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sku = null,Object? options = null,Object? price = null,Object? stock = null,Object? images = null,}) {
  return _then(ProductVariant(
sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductVariant].
extension ProductVariantPatterns on ProductVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductVariant value)  $default,){
final _that = this;
switch (_that) {
case _ProductVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductVariant value)?  $default,){
final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sku,  Map<String, String> options,  int price,  int stock,  List<String> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
return $default(_that.sku,_that.options,_that.price,_that.stock,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sku,  Map<String, String> options,  int price,  int stock,  List<String> images)  $default,) {final _that = this;
switch (_that) {
case _ProductVariant():
return $default(_that.sku,_that.options,_that.price,_that.stock,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sku,  Map<String, String> options,  int price,  int stock,  List<String> images)?  $default,) {final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
return $default(_that.sku,_that.options,_that.price,_that.stock,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductVariant implements ProductVariant {
  const _ProductVariant({required this.sku, required  Map<String, String> options, required this.price, required this.stock,  List<String> images = const <String>[]}): _options = options,_images = images;
  factory _ProductVariant.fromJson(Map<String, dynamic> json) => _$ProductVariantFromJson(json);

@override final  String sku;
 final  Map<String, String> _options;
@override Map<String, String> get options {
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_options);
}

@override final  int price;
@override final  int stock;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductVariantCopyWith<_ProductVariant> get copyWith => __$ProductVariantCopyWithImpl<_ProductVariant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductVariantToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductVariant&&(identical(other.sku, sku) || other.sku == sku)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other.images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sku,const DeepCollectionEquality().hash(_options),price,stock,const DeepCollectionEquality().hash(_images));
}

@override
String toString() {
    return 'ProductVariant(sku: $sku, options: $options, price: $price, stock: $stock, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ProductVariantCopyWith<$Res> implements $ProductVariantCopyWith<$Res> {
  factory _$ProductVariantCopyWith(_ProductVariant value, $Res Function(_ProductVariant) _then) = __$ProductVariantCopyWithImpl;
@override @useResult
$Res call({
 String sku, Map<String, String> options, int price, int stock, List<String> images
});




}
/// @nodoc
class __$ProductVariantCopyWithImpl<$Res>
    implements _$ProductVariantCopyWith<$Res> {
  __$ProductVariantCopyWithImpl(this._self, this._then);

  final _ProductVariant _self;
  final $Res Function(_ProductVariant) _then;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sku = null,Object? options = null,Object? price = null,Object? stock = null,Object? images = null,}) {
  return _then(_ProductVariant(
sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$Product {

 String get id;@JsonKey(name: 'title_en') String get titleEn;@JsonKey(name: 'title_ur') String get titleUr; String get categoryId; String get sellerId; List<String> get images; int get basePrice; int get salePrice; String get currency; double get ratingAvg; int get ratingCount; int get soldCount; Map<String, String> get attributes; List<ProductVariant> get variants; String get deliveryInfo; int get returnPolicyDays; bool get codAvailable; bool get isActive; bool get isFlashSale; String? get descriptionEn; String? get descriptionUr;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Product;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleUr, _this.titleUr) || other.titleUr == _this.titleUr)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.sellerId, _this.sellerId) || other.sellerId == _this.sellerId)&&const DeepCollectionEquality().equals(other.images, _this.images)&&(identical(other.basePrice, _this.basePrice) || other.basePrice == _this.basePrice)&&(identical(other.salePrice, _this.salePrice) || other.salePrice == _this.salePrice)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.ratingAvg, _this.ratingAvg) || other.ratingAvg == _this.ratingAvg)&&(identical(other.ratingCount, _this.ratingCount) || other.ratingCount == _this.ratingCount)&&(identical(other.soldCount, _this.soldCount) || other.soldCount == _this.soldCount)&&const DeepCollectionEquality().equals(other.attributes, _this.attributes)&&const DeepCollectionEquality().equals(other.variants, _this.variants)&&(identical(other.deliveryInfo, _this.deliveryInfo) || other.deliveryInfo == _this.deliveryInfo)&&(identical(other.returnPolicyDays, _this.returnPolicyDays) || other.returnPolicyDays == _this.returnPolicyDays)&&(identical(other.codAvailable, _this.codAvailable) || other.codAvailable == _this.codAvailable)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.isFlashSale, _this.isFlashSale) || other.isFlashSale == _this.isFlashSale)&&(identical(other.descriptionEn, _this.descriptionEn) || other.descriptionEn == _this.descriptionEn)&&(identical(other.descriptionUr, _this.descriptionUr) || other.descriptionUr == _this.descriptionUr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Product;
  return Object.hashAll([runtimeType,_this.id,_this.titleEn,_this.titleUr,_this.categoryId,_this.sellerId,const DeepCollectionEquality().hash(_this.images),_this.basePrice,_this.salePrice,_this.currency,_this.ratingAvg,_this.ratingCount,_this.soldCount,const DeepCollectionEquality().hash(_this.attributes),const DeepCollectionEquality().hash(_this.variants),_this.deliveryInfo,_this.returnPolicyDays,_this.codAvailable,_this.isActive,_this.isFlashSale,_this.descriptionEn,_this.descriptionUr]);
}

@override
String toString() {
  final _this = this as Product;
  return 'Product(id: ${_this.id}, titleEn: ${_this.titleEn}, titleUr: ${_this.titleUr}, categoryId: ${_this.categoryId}, sellerId: ${_this.sellerId}, images: ${_this.images}, basePrice: ${_this.basePrice}, salePrice: ${_this.salePrice}, currency: ${_this.currency}, ratingAvg: ${_this.ratingAvg}, ratingCount: ${_this.ratingCount}, soldCount: ${_this.soldCount}, attributes: ${_this.attributes}, variants: ${_this.variants}, deliveryInfo: ${_this.deliveryInfo}, returnPolicyDays: ${_this.returnPolicyDays}, codAvailable: ${_this.codAvailable}, isActive: ${_this.isActive}, isFlashSale: ${_this.isFlashSale}, descriptionEn: ${_this.descriptionEn}, descriptionUr: ${_this.descriptionUr})';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'title_en') String titleEn,@JsonKey(name: 'title_ur') String titleUr, String categoryId, String sellerId, List<String> images, int basePrice, int salePrice, String currency, double ratingAvg, int ratingCount, int soldCount, Map<String, String> attributes, List<ProductVariant> variants, String deliveryInfo, int returnPolicyDays, bool codAvailable, bool isActive, bool isFlashSale, String? descriptionEn, String? descriptionUr
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleEn = null,Object? titleUr = null,Object? categoryId = null,Object? sellerId = null,Object? images = null,Object? basePrice = null,Object? salePrice = null,Object? currency = null,Object? ratingAvg = null,Object? ratingCount = null,Object? soldCount = null,Object? attributes = null,Object? variants = null,Object? deliveryInfo = null,Object? returnPolicyDays = null,Object? codAvailable = null,Object? isActive = null,Object? isFlashSale = null,Object? descriptionEn = freezed,Object? descriptionUr = freezed,}) {
  return _then(Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,salePrice: null == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,ratingAvg: null == ratingAvg ? _self.ratingAvg : ratingAvg // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductVariant>,deliveryInfo: null == deliveryInfo ? _self.deliveryInfo : deliveryInfo // ignore: cast_nullable_to_non_nullable
as String,returnPolicyDays: null == returnPolicyDays ? _self.returnPolicyDays : returnPolicyDays // ignore: cast_nullable_to_non_nullable
as int,codAvailable: null == codAvailable ? _self.codAvailable : codAvailable // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isFlashSale: null == isFlashSale ? _self.isFlashSale : isFlashSale // ignore: cast_nullable_to_non_nullable
as bool,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionUr: freezed == descriptionUr ? _self.descriptionUr : descriptionUr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr,  String categoryId,  String sellerId,  List<String> images,  int basePrice,  int salePrice,  String currency,  double ratingAvg,  int ratingCount,  int soldCount,  Map<String, String> attributes,  List<ProductVariant> variants,  String deliveryInfo,  int returnPolicyDays,  bool codAvailable,  bool isActive,  bool isFlashSale,  String? descriptionEn,  String? descriptionUr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleUr,_that.categoryId,_that.sellerId,_that.images,_that.basePrice,_that.salePrice,_that.currency,_that.ratingAvg,_that.ratingCount,_that.soldCount,_that.attributes,_that.variants,_that.deliveryInfo,_that.returnPolicyDays,_that.codAvailable,_that.isActive,_that.isFlashSale,_that.descriptionEn,_that.descriptionUr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr,  String categoryId,  String sellerId,  List<String> images,  int basePrice,  int salePrice,  String currency,  double ratingAvg,  int ratingCount,  int soldCount,  Map<String, String> attributes,  List<ProductVariant> variants,  String deliveryInfo,  int returnPolicyDays,  bool codAvailable,  bool isActive,  bool isFlashSale,  String? descriptionEn,  String? descriptionUr)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.titleEn,_that.titleUr,_that.categoryId,_that.sellerId,_that.images,_that.basePrice,_that.salePrice,_that.currency,_that.ratingAvg,_that.ratingCount,_that.soldCount,_that.attributes,_that.variants,_that.deliveryInfo,_that.returnPolicyDays,_that.codAvailable,_that.isActive,_that.isFlashSale,_that.descriptionEn,_that.descriptionUr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr,  String categoryId,  String sellerId,  List<String> images,  int basePrice,  int salePrice,  String currency,  double ratingAvg,  int ratingCount,  int soldCount,  Map<String, String> attributes,  List<ProductVariant> variants,  String deliveryInfo,  int returnPolicyDays,  bool codAvailable,  bool isActive,  bool isFlashSale,  String? descriptionEn,  String? descriptionUr)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleUr,_that.categoryId,_that.sellerId,_that.images,_that.basePrice,_that.salePrice,_that.currency,_that.ratingAvg,_that.ratingCount,_that.soldCount,_that.attributes,_that.variants,_that.deliveryInfo,_that.returnPolicyDays,_that.codAvailable,_that.isActive,_that.isFlashSale,_that.descriptionEn,_that.descriptionUr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product extends Product {
  const _Product({required this.id, @JsonKey(name: 'title_en') required this.titleEn, @JsonKey(name: 'title_ur') required this.titleUr, required this.categoryId, required this.sellerId, required  List<String> images, required this.basePrice, required this.salePrice, this.currency = 'PKR', this.ratingAvg = 0.0, this.ratingCount = 0, this.soldCount = 0,  Map<String, String> attributes = const <String, String>{},  List<ProductVariant> variants = const <ProductVariant>[], this.deliveryInfo = '2-4 business days across Pakistan', this.returnPolicyDays = 7, this.codAvailable = true, this.isActive = true, this.isFlashSale = false, this.descriptionEn, this.descriptionUr}): _images = images,_attributes = attributes,_variants = variants,super._();
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  String id;
@override@JsonKey(name: 'title_en') final  String titleEn;
@override@JsonKey(name: 'title_ur') final  String titleUr;
@override final  String categoryId;
@override final  String sellerId;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  int basePrice;
@override final  int salePrice;
@override@JsonKey() final  String currency;
@override@JsonKey() final  double ratingAvg;
@override@JsonKey() final  int ratingCount;
@override@JsonKey() final  int soldCount;
 final  Map<String, String> _attributes;
@override@JsonKey() Map<String, String> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}

 final  List<ProductVariant> _variants;
@override@JsonKey() List<ProductVariant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@override@JsonKey() final  String deliveryInfo;
@override@JsonKey() final  int returnPolicyDays;
@override@JsonKey() final  bool codAvailable;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  bool isFlashSale;
@override final  String? descriptionEn;
@override final  String? descriptionUr;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleUr, titleUr) || other.titleUr == titleUr)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&const DeepCollectionEquality().equals(other.images, _images)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.ratingAvg, ratingAvg) || other.ratingAvg == ratingAvg)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&const DeepCollectionEquality().equals(other.attributes, _attributes)&&const DeepCollectionEquality().equals(other.variants, _variants)&&(identical(other.deliveryInfo, deliveryInfo) || other.deliveryInfo == deliveryInfo)&&(identical(other.returnPolicyDays, returnPolicyDays) || other.returnPolicyDays == returnPolicyDays)&&(identical(other.codAvailable, codAvailable) || other.codAvailable == codAvailable)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isFlashSale, isFlashSale) || other.isFlashSale == isFlashSale)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionUr, descriptionUr) || other.descriptionUr == descriptionUr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,titleEn,titleUr,categoryId,sellerId,const DeepCollectionEquality().hash(_images),basePrice,salePrice,currency,ratingAvg,ratingCount,soldCount,const DeepCollectionEquality().hash(_attributes),const DeepCollectionEquality().hash(_variants),deliveryInfo,returnPolicyDays,codAvailable,isActive,isFlashSale,descriptionEn,descriptionUr]);
}

@override
String toString() {
    return 'Product(id: $id, titleEn: $titleEn, titleUr: $titleUr, categoryId: $categoryId, sellerId: $sellerId, images: $images, basePrice: $basePrice, salePrice: $salePrice, currency: $currency, ratingAvg: $ratingAvg, ratingCount: $ratingCount, soldCount: $soldCount, attributes: $attributes, variants: $variants, deliveryInfo: $deliveryInfo, returnPolicyDays: $returnPolicyDays, codAvailable: $codAvailable, isActive: $isActive, isFlashSale: $isFlashSale, descriptionEn: $descriptionEn, descriptionUr: $descriptionUr)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'title_en') String titleEn,@JsonKey(name: 'title_ur') String titleUr, String categoryId, String sellerId, List<String> images, int basePrice, int salePrice, String currency, double ratingAvg, int ratingCount, int soldCount, Map<String, String> attributes, List<ProductVariant> variants, String deliveryInfo, int returnPolicyDays, bool codAvailable, bool isActive, bool isFlashSale, String? descriptionEn, String? descriptionUr
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleEn = null,Object? titleUr = null,Object? categoryId = null,Object? sellerId = null,Object? images = null,Object? basePrice = null,Object? salePrice = null,Object? currency = null,Object? ratingAvg = null,Object? ratingCount = null,Object? soldCount = null,Object? attributes = null,Object? variants = null,Object? deliveryInfo = null,Object? returnPolicyDays = null,Object? codAvailable = null,Object? isActive = null,Object? isFlashSale = null,Object? descriptionEn = freezed,Object? descriptionUr = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as int,salePrice: null == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,ratingAvg: null == ratingAvg ? _self.ratingAvg : ratingAvg // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductVariant>,deliveryInfo: null == deliveryInfo ? _self.deliveryInfo : deliveryInfo // ignore: cast_nullable_to_non_nullable
as String,returnPolicyDays: null == returnPolicyDays ? _self.returnPolicyDays : returnPolicyDays // ignore: cast_nullable_to_non_nullable
as int,codAvailable: null == codAvailable ? _self.codAvailable : codAvailable // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isFlashSale: null == isFlashSale ? _self.isFlashSale : isFlashSale // ignore: cast_nullable_to_non_nullable
as bool,descriptionEn: freezed == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String?,descriptionUr: freezed == descriptionUr ? _self.descriptionUr : descriptionUr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Seller {

 String get id; String get name; String get city; double get rating; bool get isVerified;
/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerCopyWith<Seller> get copyWith => _$SellerCopyWithImpl<Seller>(this as Seller, _$identity);

  /// Serializes this Seller to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Seller;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seller&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.isVerified, _this.isVerified) || other.isVerified == _this.isVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Seller;
  return Object.hash(runtimeType,_this.id,_this.name,_this.city,_this.rating,_this.isVerified);
}

@override
String toString() {
  final _this = this as Seller;
  return 'Seller(id: ${_this.id}, name: ${_this.name}, city: ${_this.city}, rating: ${_this.rating}, isVerified: ${_this.isVerified})';
}


}

/// @nodoc
abstract mixin class $SellerCopyWith<$Res>  {
  factory $SellerCopyWith(Seller value, $Res Function(Seller) _then) = _$SellerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String city, double rating, bool isVerified
});




}
/// @nodoc
class _$SellerCopyWithImpl<$Res>
    implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._self, this._then);

  final Seller _self;
  final $Res Function(Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? city = null,Object? rating = null,Object? isVerified = null,}) {
  return _then(Seller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Seller].
extension SellerPatterns on Seller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seller value)  $default,){
final _that = this;
switch (_that) {
case _Seller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seller value)?  $default,){
final _that = this;
switch (_that) {
case _Seller() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String city,  double rating,  bool isVerified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that.id,_that.name,_that.city,_that.rating,_that.isVerified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String city,  double rating,  bool isVerified)  $default,) {final _that = this;
switch (_that) {
case _Seller():
return $default(_that.id,_that.name,_that.city,_that.rating,_that.isVerified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String city,  double rating,  bool isVerified)?  $default,) {final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that.id,_that.name,_that.city,_that.rating,_that.isVerified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seller implements Seller {
  const _Seller({required this.id, required this.name, required this.city, required this.rating, this.isVerified = true});
  factory _Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);

@override final  String id;
@override final  String name;
@override final  String city;
@override final  double rating;
@override@JsonKey() final  bool isVerified;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerCopyWith<_Seller> get copyWith => __$SellerCopyWithImpl<_Seller>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,city,rating,isVerified);
}

@override
String toString() {
    return 'Seller(id: $id, name: $name, city: $city, rating: $rating, isVerified: $isVerified)';
}


}

/// @nodoc
abstract mixin class _$SellerCopyWith<$Res> implements $SellerCopyWith<$Res> {
  factory _$SellerCopyWith(_Seller value, $Res Function(_Seller) _then) = __$SellerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String city, double rating, bool isVerified
});




}
/// @nodoc
class __$SellerCopyWithImpl<$Res>
    implements _$SellerCopyWith<$Res> {
  __$SellerCopyWithImpl(this._self, this._then);

  final _Seller _self;
  final $Res Function(_Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? city = null,Object? rating = null,Object? isVerified = null,}) {
  return _then(_Seller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BannerItem {

 String get id;@JsonKey(name: 'title_en') String get titleEn;@JsonKey(name: 'title_ur') String get titleUr;@JsonKey(name: 'subtitle_en') String get subtitleEn;@JsonKey(name: 'subtitle_ur') String get subtitleUr; String get imageUrl; String get targetRoute; int get sortOrder; bool get isActive;
/// Create a copy of BannerItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerItemCopyWith<BannerItem> get copyWith => _$BannerItemCopyWithImpl<BannerItem>(this as BannerItem, _$identity);

  /// Serializes this BannerItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BannerItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleUr, _this.titleUr) || other.titleUr == _this.titleUr)&&(identical(other.subtitleEn, _this.subtitleEn) || other.subtitleEn == _this.subtitleEn)&&(identical(other.subtitleUr, _this.subtitleUr) || other.subtitleUr == _this.subtitleUr)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.targetRoute, _this.targetRoute) || other.targetRoute == _this.targetRoute)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BannerItem;
  return Object.hash(runtimeType,_this.id,_this.titleEn,_this.titleUr,_this.subtitleEn,_this.subtitleUr,_this.imageUrl,_this.targetRoute,_this.sortOrder,_this.isActive);
}

@override
String toString() {
  final _this = this as BannerItem;
  return 'BannerItem(id: ${_this.id}, titleEn: ${_this.titleEn}, titleUr: ${_this.titleUr}, subtitleEn: ${_this.subtitleEn}, subtitleUr: ${_this.subtitleUr}, imageUrl: ${_this.imageUrl}, targetRoute: ${_this.targetRoute}, sortOrder: ${_this.sortOrder}, isActive: ${_this.isActive})';
}


}

/// @nodoc
abstract mixin class $BannerItemCopyWith<$Res>  {
  factory $BannerItemCopyWith(BannerItem value, $Res Function(BannerItem) _then) = _$BannerItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'title_en') String titleEn,@JsonKey(name: 'title_ur') String titleUr,@JsonKey(name: 'subtitle_en') String subtitleEn,@JsonKey(name: 'subtitle_ur') String subtitleUr, String imageUrl, String targetRoute, int sortOrder, bool isActive
});




}
/// @nodoc
class _$BannerItemCopyWithImpl<$Res>
    implements $BannerItemCopyWith<$Res> {
  _$BannerItemCopyWithImpl(this._self, this._then);

  final BannerItem _self;
  final $Res Function(BannerItem) _then;

/// Create a copy of BannerItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleEn = null,Object? titleUr = null,Object? subtitleEn = null,Object? subtitleUr = null,Object? imageUrl = null,Object? targetRoute = null,Object? sortOrder = null,Object? isActive = null,}) {
  return _then(BannerItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleUr: null == subtitleUr ? _self.subtitleUr : subtitleUr // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,targetRoute: null == targetRoute ? _self.targetRoute : targetRoute // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerItem].
extension BannerItemPatterns on BannerItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerItem value)  $default,){
final _that = this;
switch (_that) {
case _BannerItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerItem value)?  $default,){
final _that = this;
switch (_that) {
case _BannerItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr, @JsonKey(name: 'subtitle_en')  String subtitleEn, @JsonKey(name: 'subtitle_ur')  String subtitleUr,  String imageUrl,  String targetRoute,  int sortOrder,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerItem() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleUr,_that.subtitleEn,_that.subtitleUr,_that.imageUrl,_that.targetRoute,_that.sortOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr, @JsonKey(name: 'subtitle_en')  String subtitleEn, @JsonKey(name: 'subtitle_ur')  String subtitleUr,  String imageUrl,  String targetRoute,  int sortOrder,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _BannerItem():
return $default(_that.id,_that.titleEn,_that.titleUr,_that.subtitleEn,_that.subtitleUr,_that.imageUrl,_that.targetRoute,_that.sortOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr, @JsonKey(name: 'subtitle_en')  String subtitleEn, @JsonKey(name: 'subtitle_ur')  String subtitleUr,  String imageUrl,  String targetRoute,  int sortOrder,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _BannerItem() when $default != null:
return $default(_that.id,_that.titleEn,_that.titleUr,_that.subtitleEn,_that.subtitleUr,_that.imageUrl,_that.targetRoute,_that.sortOrder,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerItem extends BannerItem {
  const _BannerItem({required this.id, @JsonKey(name: 'title_en') required this.titleEn, @JsonKey(name: 'title_ur') required this.titleUr, @JsonKey(name: 'subtitle_en') required this.subtitleEn, @JsonKey(name: 'subtitle_ur') required this.subtitleUr, required this.imageUrl, required this.targetRoute, required this.sortOrder, this.isActive = true}): super._();
  factory _BannerItem.fromJson(Map<String, dynamic> json) => _$BannerItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'title_en') final  String titleEn;
@override@JsonKey(name: 'title_ur') final  String titleUr;
@override@JsonKey(name: 'subtitle_en') final  String subtitleEn;
@override@JsonKey(name: 'subtitle_ur') final  String subtitleUr;
@override final  String imageUrl;
@override final  String targetRoute;
@override final  int sortOrder;
@override@JsonKey() final  bool isActive;

/// Create a copy of BannerItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerItemCopyWith<_BannerItem> get copyWith => __$BannerItemCopyWithImpl<_BannerItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerItem&&(identical(other.id, id) || other.id == id)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleUr, titleUr) || other.titleUr == titleUr)&&(identical(other.subtitleEn, subtitleEn) || other.subtitleEn == subtitleEn)&&(identical(other.subtitleUr, subtitleUr) || other.subtitleUr == subtitleUr)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.targetRoute, targetRoute) || other.targetRoute == targetRoute)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,titleEn,titleUr,subtitleEn,subtitleUr,imageUrl,targetRoute,sortOrder,isActive);
}

@override
String toString() {
    return 'BannerItem(id: $id, titleEn: $titleEn, titleUr: $titleUr, subtitleEn: $subtitleEn, subtitleUr: $subtitleUr, imageUrl: $imageUrl, targetRoute: $targetRoute, sortOrder: $sortOrder, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$BannerItemCopyWith<$Res> implements $BannerItemCopyWith<$Res> {
  factory _$BannerItemCopyWith(_BannerItem value, $Res Function(_BannerItem) _then) = __$BannerItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'title_en') String titleEn,@JsonKey(name: 'title_ur') String titleUr,@JsonKey(name: 'subtitle_en') String subtitleEn,@JsonKey(name: 'subtitle_ur') String subtitleUr, String imageUrl, String targetRoute, int sortOrder, bool isActive
});




}
/// @nodoc
class __$BannerItemCopyWithImpl<$Res>
    implements _$BannerItemCopyWith<$Res> {
  __$BannerItemCopyWithImpl(this._self, this._then);

  final _BannerItem _self;
  final $Res Function(_BannerItem) _then;

/// Create a copy of BannerItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleEn = null,Object? titleUr = null,Object? subtitleEn = null,Object? subtitleUr = null,Object? imageUrl = null,Object? targetRoute = null,Object? sortOrder = null,Object? isActive = null,}) {
  return _then(_BannerItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,subtitleEn: null == subtitleEn ? _self.subtitleEn : subtitleEn // ignore: cast_nullable_to_non_nullable
as String,subtitleUr: null == subtitleUr ? _self.subtitleUr : subtitleUr // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,targetRoute: null == targetRoute ? _self.targetRoute : targetRoute // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Voucher {

 String get id; String get code;@JsonKey(name: 'title_en') String get titleEn;@JsonKey(name: 'title_ur') String get titleUr; int get discountAmount; int get minOrderAmount; bool get isPercent; DateTime get expiresAt;
/// Create a copy of Voucher
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherCopyWith<Voucher> get copyWith => _$VoucherCopyWithImpl<Voucher>(this as Voucher, _$identity);

  /// Serializes this Voucher to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Voucher;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Voucher&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.titleEn, _this.titleEn) || other.titleEn == _this.titleEn)&&(identical(other.titleUr, _this.titleUr) || other.titleUr == _this.titleUr)&&(identical(other.discountAmount, _this.discountAmount) || other.discountAmount == _this.discountAmount)&&(identical(other.minOrderAmount, _this.minOrderAmount) || other.minOrderAmount == _this.minOrderAmount)&&(identical(other.isPercent, _this.isPercent) || other.isPercent == _this.isPercent)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Voucher;
  return Object.hash(runtimeType,_this.id,_this.code,_this.titleEn,_this.titleUr,_this.discountAmount,_this.minOrderAmount,_this.isPercent,_this.expiresAt);
}

@override
String toString() {
  final _this = this as Voucher;
  return 'Voucher(id: ${_this.id}, code: ${_this.code}, titleEn: ${_this.titleEn}, titleUr: ${_this.titleUr}, discountAmount: ${_this.discountAmount}, minOrderAmount: ${_this.minOrderAmount}, isPercent: ${_this.isPercent}, expiresAt: ${_this.expiresAt})';
}


}

/// @nodoc
abstract mixin class $VoucherCopyWith<$Res>  {
  factory $VoucherCopyWith(Voucher value, $Res Function(Voucher) _then) = _$VoucherCopyWithImpl;
@useResult
$Res call({
 String id, String code,@JsonKey(name: 'title_en') String titleEn,@JsonKey(name: 'title_ur') String titleUr, int discountAmount, int minOrderAmount, bool isPercent, DateTime expiresAt
});




}
/// @nodoc
class _$VoucherCopyWithImpl<$Res>
    implements $VoucherCopyWith<$Res> {
  _$VoucherCopyWithImpl(this._self, this._then);

  final Voucher _self;
  final $Res Function(Voucher) _then;

/// Create a copy of Voucher
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? titleEn = null,Object? titleUr = null,Object? discountAmount = null,Object? minOrderAmount = null,Object? isPercent = null,Object? expiresAt = null,}) {
  return _then(Voucher(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,minOrderAmount: null == minOrderAmount ? _self.minOrderAmount : minOrderAmount // ignore: cast_nullable_to_non_nullable
as int,isPercent: null == isPercent ? _self.isPercent : isPercent // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Voucher].
extension VoucherPatterns on Voucher {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Voucher value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Voucher() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Voucher value)  $default,){
final _that = this;
switch (_that) {
case _Voucher():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Voucher value)?  $default,){
final _that = this;
switch (_that) {
case _Voucher() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr,  int discountAmount,  int minOrderAmount,  bool isPercent,  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Voucher() when $default != null:
return $default(_that.id,_that.code,_that.titleEn,_that.titleUr,_that.discountAmount,_that.minOrderAmount,_that.isPercent,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr,  int discountAmount,  int minOrderAmount,  bool isPercent,  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _Voucher():
return $default(_that.id,_that.code,_that.titleEn,_that.titleUr,_that.discountAmount,_that.minOrderAmount,_that.isPercent,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code, @JsonKey(name: 'title_en')  String titleEn, @JsonKey(name: 'title_ur')  String titleUr,  int discountAmount,  int minOrderAmount,  bool isPercent,  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _Voucher() when $default != null:
return $default(_that.id,_that.code,_that.titleEn,_that.titleUr,_that.discountAmount,_that.minOrderAmount,_that.isPercent,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Voucher extends Voucher {
  const _Voucher({required this.id, required this.code, @JsonKey(name: 'title_en') required this.titleEn, @JsonKey(name: 'title_ur') required this.titleUr, required this.discountAmount, required this.minOrderAmount, required this.isPercent, required this.expiresAt}): super._();
  factory _Voucher.fromJson(Map<String, dynamic> json) => _$VoucherFromJson(json);

@override final  String id;
@override final  String code;
@override@JsonKey(name: 'title_en') final  String titleEn;
@override@JsonKey(name: 'title_ur') final  String titleUr;
@override final  int discountAmount;
@override final  int minOrderAmount;
@override final  bool isPercent;
@override final  DateTime expiresAt;

/// Create a copy of Voucher
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherCopyWith<_Voucher> get copyWith => __$VoucherCopyWithImpl<_Voucher>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoucherToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Voucher&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleUr, titleUr) || other.titleUr == titleUr)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.minOrderAmount, minOrderAmount) || other.minOrderAmount == minOrderAmount)&&(identical(other.isPercent, isPercent) || other.isPercent == isPercent)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,titleEn,titleUr,discountAmount,minOrderAmount,isPercent,expiresAt);
}

@override
String toString() {
    return 'Voucher(id: $id, code: $code, titleEn: $titleEn, titleUr: $titleUr, discountAmount: $discountAmount, minOrderAmount: $minOrderAmount, isPercent: $isPercent, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$VoucherCopyWith<$Res> implements $VoucherCopyWith<$Res> {
  factory _$VoucherCopyWith(_Voucher value, $Res Function(_Voucher) _then) = __$VoucherCopyWithImpl;
@override @useResult
$Res call({
 String id, String code,@JsonKey(name: 'title_en') String titleEn,@JsonKey(name: 'title_ur') String titleUr, int discountAmount, int minOrderAmount, bool isPercent, DateTime expiresAt
});




}
/// @nodoc
class __$VoucherCopyWithImpl<$Res>
    implements _$VoucherCopyWith<$Res> {
  __$VoucherCopyWithImpl(this._self, this._then);

  final _Voucher _self;
  final $Res Function(_Voucher) _then;

/// Create a copy of Voucher
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? titleEn = null,Object? titleUr = null,Object? discountAmount = null,Object? minOrderAmount = null,Object? isPercent = null,Object? expiresAt = null,}) {
  return _then(_Voucher(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleUr: null == titleUr ? _self.titleUr : titleUr // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,minOrderAmount: null == minOrderAmount ? _self.minOrderAmount : minOrderAmount // ignore: cast_nullable_to_non_nullable
as int,isPercent: null == isPercent ? _self.isPercent : isPercent // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
