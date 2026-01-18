import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/url_const.dart';
import 'package:ssnbuilds/enums/app_tabs.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.sliver});

  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
                    onPressed: () {
                      final uri = Uri.parse(URLConsts.resume);
                      launchUrl(uri, mode: .externalApplication);
                    },
                    child: const Text("download cv"),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.only(top: context.gutter),
            sliver: sliver,
          ),
        ],
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
