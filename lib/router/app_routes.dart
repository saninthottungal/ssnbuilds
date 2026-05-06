import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ssnbuilds/enums/app_tabs.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
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
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: context.gutterSmall),
                child: Row(
                  children: [
                    //* Logo
                    Image.asset(
                      Assets.logo.textLogo.path,
                      width: 200,
                      height: 50,
                    ),

                    //* Spacer
                    const Spacer(),

                    const _Tabs(),
                  ],
                ),
              ),
            ),
          ];
        },
        body: navigator,
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs();

  AppTab _getTab(String location) {
    if (location.startsWith('/builds')) {
      return .builds;
    }

    if (location.startsWith('/about')) {
      return .about;
    }

    return .home;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final currentTab = _getTab(location);

    return Row(
      spacing: context.gutter,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        AppTab.values.length,
        (index) {
          final color = index == AppTab.values.indexOf(currentTab)
              ? context.colorScheme.primary
              : context.colorScheme.onSurface;

          return GestureDetector(
            onTap: () {
              final tab = AppTab.values[index];
              switch (tab) {
                case .home:
                  const HomeRoute().go(context);
                case .builds:
                  const BuildsRoute().go(context);
                case .about:
                  const AboutRoute().go(context);
              }
            },
            behavior: HitTestBehavior.translucent,
            child: TweenAnimationBuilder(
              tween: ColorTween(
                begin: context.colorScheme.onSurface,
                end: color,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              builder: (context, color, _) {
                if (context.isMobile) {
                  return Icon(
                    AppTab.values[index].icon,
                    color: color,
                    size: 20,
                  );
                } else {
                  return Text(
                    AppTab.values[index].label,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: color,
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
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
