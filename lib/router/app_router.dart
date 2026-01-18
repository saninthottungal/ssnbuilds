import 'package:go_router/go_router.dart';
import 'package:ssnbuilds/pages/about_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const AboutPage()),
  ],
);
