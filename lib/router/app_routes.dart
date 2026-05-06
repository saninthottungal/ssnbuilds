import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ssnbuilds/pages/about_page.dart';
import 'package:ssnbuilds/pages/builds_page.dart';
import 'package:ssnbuilds/pages/home_page.dart';

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
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {}
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class BuildsRoute extends GoRouteData with $BuildsRoute {
  const BuildsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BuildsPage();
  }
}

class AboutRoute extends GoRouteData with $AboutRoute {
  const AboutRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutPage();
  }
}
