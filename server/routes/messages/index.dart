import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:shared/shared.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    .get => await _get(context),
    .post => await _post(context),
    _ => Response(statusCode: 405),
  };
}

Future<Response> _get(RequestContext context) async {
  final db = await context.read<Future<AppDatabase>>();
  final messages = await db.getAllMessages();
  return Response.json(body: messages);
}

Future<Response> _post(RequestContext context) async {
  final body = (await context.request.json()) as Map<String, dynamic>;
  final name = body['name'] as String;
  final message = body['message'] as String;
  final email = body['email'] as String?;

  final messageObj = AppMessage(
    /// dummy
    id: 1111,
    name: name,
    message: message,
    email: email,

    // dummy
    createdAt: DateTime.now(),
  );

  final db = await context.read<Future<AppDatabase>>();
  await db.addMessage(messageObj);

  return Response(body: 'Message Added Successfully....!');
}
