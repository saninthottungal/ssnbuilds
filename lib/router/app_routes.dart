import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ssnbuilds/pages/about_page.dart';
import 'package:ssnbuilds/pages/builds_page.dart';
import 'package:ssnbuilds/pages/home_page.dart';
import 'package:ssnbuilds/router/app_shell_ui.dart';

part 'app_routes.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<MyShellRouteData>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/'),
    TypedGoRoute<BuildsRoute>(path: '/builds'),
    TypedGoRoute<AboutRoute>(path: '/about'),
  ],
)
class MyShellRouteData extends ShellRouteData {
  const MyShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppShellUI(child: navigator);
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HomePage());
  }
}

class BuildsRoute extends GoRouteData with $BuildsRoute {
  const BuildsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: BuildsPage());
  }
}

class AboutRoute extends GoRouteData with $AboutRoute {
  const AboutRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: AboutPage());
  }
}
