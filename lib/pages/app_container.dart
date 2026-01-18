import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/enums/app_tabs.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
import 'package:ssnbuilds/pages/about_page.dart';
import 'package:ssnbuilds/pages/home_page.dart';
import 'package:ssnbuilds/pages/projects_page.dart';
import 'package:ssnbuilds/widgets/social_media_row.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  AppTab currentTab = AppTab.about;

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

                  _Tabs(
                    currentTab: currentTab,
                    onChanged: (tab) => setState(
                      () => currentTab = tab,
                    ),
                  ),

                  //
                  // ElevatedButton(
                  //   onPressed: () {
                  //     final uri = Uri.parse(URLConsts.resume);
                  //     launchUrl(uri, mode: .externalApplication);
                  //   },
                  //   child: const Text("download cv"),
                  // ),
                ],
              ),
            ),
          ),

          //* The main body content
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: context.gutter),
            sliver: switch (currentTab) {
              .home => const HomePage(),
              .builds => const BuildsPage(),
              .about => const AboutPage(),
            },
          ),

          //* footer
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(vertical: context.gutterSmall),
              child: Column(
                spacing: context.gutterTiny,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // copyright info
                  const Text("©2026 ssnbuilds by Sanin. All rights reserved."),

                  // social media row
                  const SocialMediaRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    required this.currentTab,
    required this.onChanged,
  });

  final ValueChanged<AppTab> onChanged;
  final AppTab currentTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.gutter,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        AppTab.values.length,
        (index) => GestureDetector(
          onTap: () => onChanged(AppTab.values[index]),
          behavior: HitTestBehavior.translucent,
          child: Text(
            AppTab.values[index].label,
            style: context.textTheme.titleMedium?.copyWith(
              color: index == AppTab.values.indexOf(currentTab)
                  ? context.colorScheme.primary
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
