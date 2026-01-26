import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';
part 'messages.g.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String name,
    required String message,
    required DateTime createdAt,
    String? email,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
