// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  name: json['name'] as String,
  message: json['message'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  email: json['email'] as String?,
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'message': instance.message,
  'createdAt': instance.createdAt.toIso8601String(),
  'email': instance.email,
};
