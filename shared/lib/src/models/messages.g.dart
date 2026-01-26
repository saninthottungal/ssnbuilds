// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppMessage _$AppMessageFromJson(Map<String, dynamic> json) => _AppMessage(
  id: json['id'] as String,
  name: json['name'] as String,
  message: json['message'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  email: json['email'] as String?,
);

Map<String, dynamic> _$AppMessageToJson(_AppMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'message': instance.message,
      'createdAt': instance.createdAt.toIso8601String(),
      'email': instance.email,
    };
