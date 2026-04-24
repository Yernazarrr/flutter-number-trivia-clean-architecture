// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NumberEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NumberEvent()';
}


}

/// @nodoc
class $NumberEventCopyWith<$Res>  {
$NumberEventCopyWith(NumberEvent _, $Res Function(NumberEvent) __);
}


/// Adds pattern-matching-related methods to [NumberEvent].
extension NumberEventPatterns on NumberEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetConcreteNumberEvent value)?  getConcreteNumber,TResult Function( GetRandomNumberEvent value)?  getRandomNumber,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetConcreteNumberEvent() when getConcreteNumber != null:
return getConcreteNumber(_that);case GetRandomNumberEvent() when getRandomNumber != null:
return getRandomNumber(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetConcreteNumberEvent value)  getConcreteNumber,required TResult Function( GetRandomNumberEvent value)  getRandomNumber,}){
final _that = this;
switch (_that) {
case GetConcreteNumberEvent():
return getConcreteNumber(_that);case GetRandomNumberEvent():
return getRandomNumber(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetConcreteNumberEvent value)?  getConcreteNumber,TResult? Function( GetRandomNumberEvent value)?  getRandomNumber,}){
final _that = this;
switch (_that) {
case GetConcreteNumberEvent() when getConcreteNumber != null:
return getConcreteNumber(_that);case GetRandomNumberEvent() when getRandomNumber != null:
return getRandomNumber(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int number)?  getConcreteNumber,TResult Function()?  getRandomNumber,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetConcreteNumberEvent() when getConcreteNumber != null:
return getConcreteNumber(_that.number);case GetRandomNumberEvent() when getRandomNumber != null:
return getRandomNumber();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int number)  getConcreteNumber,required TResult Function()  getRandomNumber,}) {final _that = this;
switch (_that) {
case GetConcreteNumberEvent():
return getConcreteNumber(_that.number);case GetRandomNumberEvent():
return getRandomNumber();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int number)?  getConcreteNumber,TResult? Function()?  getRandomNumber,}) {final _that = this;
switch (_that) {
case GetConcreteNumberEvent() when getConcreteNumber != null:
return getConcreteNumber(_that.number);case GetRandomNumberEvent() when getRandomNumber != null:
return getRandomNumber();case _:
  return null;

}
}

}

/// @nodoc


class GetConcreteNumberEvent implements NumberEvent {
  const GetConcreteNumberEvent(this.number);
  

 final  int number;

/// Create a copy of NumberEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetConcreteNumberEventCopyWith<GetConcreteNumberEvent> get copyWith => _$GetConcreteNumberEventCopyWithImpl<GetConcreteNumberEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetConcreteNumberEvent&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,number);

@override
String toString() {
  return 'NumberEvent.getConcreteNumber(number: $number)';
}


}

/// @nodoc
abstract mixin class $GetConcreteNumberEventCopyWith<$Res> implements $NumberEventCopyWith<$Res> {
  factory $GetConcreteNumberEventCopyWith(GetConcreteNumberEvent value, $Res Function(GetConcreteNumberEvent) _then) = _$GetConcreteNumberEventCopyWithImpl;
@useResult
$Res call({
 int number
});




}
/// @nodoc
class _$GetConcreteNumberEventCopyWithImpl<$Res>
    implements $GetConcreteNumberEventCopyWith<$Res> {
  _$GetConcreteNumberEventCopyWithImpl(this._self, this._then);

  final GetConcreteNumberEvent _self;
  final $Res Function(GetConcreteNumberEvent) _then;

/// Create a copy of NumberEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? number = null,}) {
  return _then(GetConcreteNumberEvent(
null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GetRandomNumberEvent implements NumberEvent {
  const GetRandomNumberEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRandomNumberEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NumberEvent.getRandomNumber()';
}


}




// dart format on
