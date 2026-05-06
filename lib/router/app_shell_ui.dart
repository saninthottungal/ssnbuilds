import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ssnbuilds/enums/app_tabs.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
import 'package:ssnbuilds/router/app_routes.dart';

class AppShellUI extends StatelessWidget {
  const AppShellUI({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
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
        body: child,
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
