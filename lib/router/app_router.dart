import 'package:go_router/go_router.dart';
import 'package:ssnbuilds/router/app_routes.dart';

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: $appRoutes,
  debugLogDiagnostics: true,
);
