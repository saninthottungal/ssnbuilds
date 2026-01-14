import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ssnbuilds/enums/app_tabs.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppTabs.values.length,
      child: Scaffold(
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

                      //* Tabs - commented temporarly
                      //TODO - implement tab screens and uncomment this
                      // _Tabs(
                      //   currentIndex: shell.currentIndex,
                      //   onChanged: shell.goBranch,
                      // ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("download cv"),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.only(top: context.gutter),
            child: shell,
          ),
        ),
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    required this.currentIndex,
    required this.onChanged,
  });

  final ValueChanged<int> onChanged;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.gutter,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        AppTabs.values.length,
        (index) => GestureDetector(
          onTap: () => onChanged(index),
          behavior: HitTestBehavior.translucent,
          child: Text(
            AppTabs.values[index].label,
            style: context.textTheme.titleMedium?.copyWith(
              color: index == currentIndex ? context.colorScheme.primary : null,
            ),
          ),
        ),
      ),
    );
  }
}
