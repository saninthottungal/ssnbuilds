// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {

 String get id; String get name; String get message; DateTime get createdAt; String? get email;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,message,createdAt,email);

@override
String toString() {
  return 'Message(id: $id, name: $name, message: $message, createdAt: $createdAt, email: $email)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
 String id, String name, String message, DateTime createdAt, String? email
});




}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? message = null,Object? createdAt = null,Object? email = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String message,  DateTime createdAt,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.name,_that.message,_that.createdAt,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String message,  DateTime createdAt,  String? email)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.id,_that.name,_that.message,_that.createdAt,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String message,  DateTime createdAt,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.name,_that.message,_that.createdAt,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Message implements Message {
  const _Message({required this.id, required this.name, required this.message, required this.createdAt, this.email});
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

@override final  String id;
@override final  String name;
@override final  String message;
@override final  DateTime createdAt;
@override final  String? email;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,message,createdAt,email);

@override
String toString() {
  return 'Message(id: $id, name: $name, message: $message, createdAt: $createdAt, email: $email)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String message, DateTime createdAt, String? email
});




}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? message = null,Object? createdAt = null,Object? email = freezed,}) {
  return _then(_Message(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
