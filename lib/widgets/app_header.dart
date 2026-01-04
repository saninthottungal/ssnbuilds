import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/enums/app_tabs.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

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
                      Image.network(
                        'web/assets/logo/text_logo.png',
                        width: 200,
                        height: 50,
                      ),

                      //* Spacer
                      const Spacer(),

                      //* Tabs
                      const _Tabs(),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(title: Text('Item $index'));
            },
          ),
        ),
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      dividerColor: Colors.transparent,
      dividerHeight: 0,
      indicatorWeight: 1,
      tabs: List.generate(
        AppTabs.values.length,
        (index) => Tab(text: AppTabs.values[index].label),
      ),
    );
  }
}
