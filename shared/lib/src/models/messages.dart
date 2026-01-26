import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';
part 'messages.g.dart';

@freezed
abstract class AppMessage with _$AppMessage {
  const factory AppMessage({
    required String id,
    required String name,
    required String message,
    required DateTime createdAt,
    String? email,
  }) = _AppMessage;

  factory AppMessage.fromJson(Map<String, dynamic> json) =>
      _$AppMessageFromJson(json);
}
