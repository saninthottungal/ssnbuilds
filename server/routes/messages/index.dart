import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    .get => await _get(context),
    .post => await _post(context),
    _ => Response(statusCode: 405),
  };
}

Future<Response> _get(RequestContext context) async {
  return Response();
}

Future<Response> _post(RequestContext context) async {
  return Response();
}
