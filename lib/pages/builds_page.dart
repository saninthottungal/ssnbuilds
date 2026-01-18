import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/content_const.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/widgets/content_wrapper.dart';

class BuildsPage extends StatelessWidget {
  const BuildsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        //* Header
        SliverToBoxAdapter(
          child: ContentWrapper(
            child: Text(
              "Builds Showcase",
              style: TextStyle(
                fontFamily: 'minecraft_block',
                fontSize: 24,
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),

        //* spacing
        const SliverToBoxAdapter(child: Gutter()),

        SliverToBoxAdapter(
          child: ContentWrapper(
            leading: Icons.flutter_dash_outlined,
            title: 'Flutter',
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    spacing: context.gutterSmall,
                    children: [
                      //* Penny Box
                      Expanded(
                        child: ContentWrapper(
                          leading: Icons.monetization_on,
                          title: 'Penny Box',
                          child: Column(
                            children: [
                              Text(
                                ContentConsts.builds.pennyBoxDesc,
                              ),
                            ],
                          ),
                        ),
                      ),

                      //* travel payouts
                      Expanded(
                        child: ContentWrapper(
                          leading: Icons.flight,
                          title: 'Fair Flights',
                          child: Column(
                            children: [
                              Text(
                                ContentConsts.builds.fairFlightsDesc,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
