// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NumberEntity {

 String get text; int get number;
/// Create a copy of NumberEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NumberEntityCopyWith<NumberEntity> get copyWith => _$NumberEntityCopyWithImpl<NumberEntity>(this as NumberEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberEntity&&(identical(other.text, text) || other.text == text)&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,text,number);

@override
String toString() {
  return 'NumberEntity(text: $text, number: $number)';
}


}

/// @nodoc
abstract mixin class $NumberEntityCopyWith<$Res>  {
  factory $NumberEntityCopyWith(NumberEntity value, $Res Function(NumberEntity) _then) = _$NumberEntityCopyWithImpl;
@useResult
$Res call({
 String text, int number
});




}
/// @nodoc
class _$NumberEntityCopyWithImpl<$Res>
    implements $NumberEntityCopyWith<$Res> {
  _$NumberEntityCopyWithImpl(this._self, this._then);

  final NumberEntity _self;
  final $Res Function(NumberEntity) _then;

/// Create a copy of NumberEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? number = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NumberEntity].
extension NumberEntityPatterns on NumberEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NumberEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NumberEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NumberEntity value)  $default,){
final _that = this;
switch (_that) {
case _NumberEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NumberEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NumberEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  int number)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NumberEntity() when $default != null:
return $default(_that.text,_that.number);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  int number)  $default,) {final _that = this;
switch (_that) {
case _NumberEntity():
return $default(_that.text,_that.number);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  int number)?  $default,) {final _that = this;
switch (_that) {
case _NumberEntity() when $default != null:
return $default(_that.text,_that.number);case _:
  return null;

}
}

}

/// @nodoc


class _NumberEntity implements NumberEntity {
  const _NumberEntity({required this.text, required this.number});
  

@override final  String text;
@override final  int number;

/// Create a copy of NumberEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NumberEntityCopyWith<_NumberEntity> get copyWith => __$NumberEntityCopyWithImpl<_NumberEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NumberEntity&&(identical(other.text, text) || other.text == text)&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,text,number);

@override
String toString() {
  return 'NumberEntity(text: $text, number: $number)';
}


}

/// @nodoc
abstract mixin class _$NumberEntityCopyWith<$Res> implements $NumberEntityCopyWith<$Res> {
  factory _$NumberEntityCopyWith(_NumberEntity value, $Res Function(_NumberEntity) _then) = __$NumberEntityCopyWithImpl;
@override @useResult
$Res call({
 String text, int number
});




}
/// @nodoc
class __$NumberEntityCopyWithImpl<$Res>
    implements _$NumberEntityCopyWith<$Res> {
  __$NumberEntityCopyWithImpl(this._self, this._then);

  final _NumberEntity _self;
  final $Res Function(_NumberEntity) _then;

/// Create a copy of NumberEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? number = null,}) {
  return _then(_NumberEntity(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
