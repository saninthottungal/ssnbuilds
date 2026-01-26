import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:dotenv/dotenv.dart';
import 'package:server/contants/env_consts.dart';

AppDatabase? _appDb;
DotEnv? _env;

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(appDbProvider())
      .use(dotEnvProvider());
}

Middleware appDbProvider() {
  return provider<Future<AppDatabase>>((context) async {
    if (_appDb != null) return Future.value(_appDb);

    final env = context.read<DotEnv>();

    final dbHost =
        Platform.environment[EnvConsts.dbHost] ?? env[EnvConsts.dbHost] ?? '';
    final dbPass =
        Platform.environment[EnvConsts.dbPass] ?? env[EnvConsts.dbPass] ?? '';
    final dbEndpoint =
        Platform.environment[EnvConsts.dbEndPoint] ??
        env[EnvConsts.dbEndPoint] ??
        '';

    final url = dbHost + dbPass + dbEndpoint;

    return AppDatabase.create(url);
  });
}

Middleware dotEnvProvider() {
  return provider((_) => _env ??= DotEnv()..load());
}
