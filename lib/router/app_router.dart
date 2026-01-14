import 'package:go_router/go_router.dart';
import 'package:ssnbuilds/pages/about_page.dart';
import 'package:ssnbuilds/pages/home_page.dart';
import 'package:ssnbuilds/pages/projects_page.dart';
import 'package:ssnbuilds/widgets/app_header.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppHeader(shell: navigationShell);
      },
      branches: [
        //TODO - implement tab screens and uncomment this
        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //       path: '/',
        //       builder: (_, _) => const HomePage(),
        //     ),
        //   ],
        // ),
        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //       path: '/builds',
        //       builder: (_, _) => const ProjectsPage(),
        //     ),
        //   ],
        // ),
        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //       path: '/about',
        //       builder: (_, _) => const AboutPage(),
        //     ),
        //   ],
        // ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (_, _) => const AboutPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
