import 'package:go_router/go_router.dart';
import 'package:ssnbuilds/pages/about_page.dart';
import 'package:ssnbuilds/pages/home_page.dart';
import 'package:ssnbuilds/pages/projects_page.dart';
import 'package:ssnbuilds/widgets/app_header.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppHeader(child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (_, _) => const HomePage()),
        GoRoute(path: '/projects', builder: (_, _) => const ProjectsPage()),
        GoRoute(path: '/about', builder: (_, _) => const AboutPage()),
      ],
    ),
  ],
);
