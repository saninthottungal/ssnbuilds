import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';
part 'messages.g.dart';

@freezed
abstract class AppMessage with _$AppMessage {
  const factory AppMessage({
    required int id,
    required String name,
    required String message,
    @JsonKey(name: 'createdat') required DateTime createdAt,
    String? email,
  }) = _AppMessage;

  factory AppMessage.fromJson(Map<String, dynamic> json) =>
      _$AppMessageFromJson(json);
}
