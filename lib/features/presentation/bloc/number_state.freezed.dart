// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NumberState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NumberState()';
}


}

/// @nodoc
class $NumberStateCopyWith<$Res>  {
$NumberStateCopyWith(NumberState _, $Res Function(NumberState) __);
}


/// Adds pattern-matching-related methods to [NumberState].
extension NumberStatePatterns on NumberState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( ErrorDetails value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorDetails() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( ErrorDetails value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case ErrorDetails():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( ErrorDetails value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorDetails() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<NumberEntity> history)?  loading,TResult Function( NumberEntity number,  List<NumberEntity> history)?  loaded,TResult Function( String message,  List<NumberEntity> history)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.history);case Loaded() when loaded != null:
return loaded(_that.number,_that.history);case ErrorDetails() when error != null:
return error(_that.message,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<NumberEntity> history)  loading,required TResult Function( NumberEntity number,  List<NumberEntity> history)  loaded,required TResult Function( String message,  List<NumberEntity> history)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading(_that.history);case Loaded():
return loaded(_that.number,_that.history);case ErrorDetails():
return error(_that.message,_that.history);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<NumberEntity> history)?  loading,TResult? Function( NumberEntity number,  List<NumberEntity> history)?  loaded,TResult? Function( String message,  List<NumberEntity> history)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading(_that.history);case Loaded() when loaded != null:
return loaded(_that.number,_that.history);case ErrorDetails() when error != null:
return error(_that.message,_that.history);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements NumberState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NumberState.initial()';
}


}




/// @nodoc


class Loading implements NumberState {
  const Loading({final  List<NumberEntity> history = const []}): _history = history;
  

 final  List<NumberEntity> _history;
@JsonKey() List<NumberEntity> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of NumberState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'NumberState.loading(history: $history)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $NumberStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@useResult
$Res call({
 List<NumberEntity> history
});




}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of NumberState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? history = null,}) {
  return _then(Loading(
history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<NumberEntity>,
  ));
}


}

/// @nodoc


class Loaded implements NumberState {
  const Loaded({required this.number, final  List<NumberEntity> history = const []}): _history = history;
  

 final  NumberEntity number;
 final  List<NumberEntity> _history;
@JsonKey() List<NumberEntity> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of NumberState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.number, number) || other.number == number)&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,number,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'NumberState.loaded(number: $number, history: $history)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $NumberStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 NumberEntity number, List<NumberEntity> history
});


$NumberEntityCopyWith<$Res> get number;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of NumberState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? number = null,Object? history = null,}) {
  return _then(Loaded(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as NumberEntity,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<NumberEntity>,
  ));
}

/// Create a copy of NumberState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NumberEntityCopyWith<$Res> get number {
  
  return $NumberEntityCopyWith<$Res>(_self.number, (value) {
    return _then(_self.copyWith(number: value));
  });
}
}

/// @nodoc


class ErrorDetails implements NumberState {
  const ErrorDetails({required this.message, final  List<NumberEntity> history = const []}): _history = history;
  

 final  String message;
 final  List<NumberEntity> _history;
@JsonKey() List<NumberEntity> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of NumberState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorDetailsCopyWith<ErrorDetails> get copyWith => _$ErrorDetailsCopyWithImpl<ErrorDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorDetails&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'NumberState.error(message: $message, history: $history)';
}


}

/// @nodoc
abstract mixin class $ErrorDetailsCopyWith<$Res> implements $NumberStateCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(ErrorDetails value, $Res Function(ErrorDetails) _then) = _$ErrorDetailsCopyWithImpl;
@useResult
$Res call({
 String message, List<NumberEntity> history
});




}
/// @nodoc
class _$ErrorDetailsCopyWithImpl<$Res>
    implements $ErrorDetailsCopyWith<$Res> {
  _$ErrorDetailsCopyWithImpl(this._self, this._then);

  final ErrorDetails _self;
  final $Res Function(ErrorDetails) _then;

/// Create a copy of NumberState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? history = null,}) {
  return _then(ErrorDetails(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<NumberEntity>,
  ));
}


}

// dart format on
