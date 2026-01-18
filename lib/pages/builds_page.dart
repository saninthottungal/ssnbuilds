import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/content_const.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
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
                          trailingWidget: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Row(
                              spacing: context.gutterTiny,
                              mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        context.colorScheme.onPrimaryContainer,
                                  ),

                                  child: Assets.icons.github.image(
                                    height: 16,
                                  ),
                                ),

                                Text(
                                  "GitHub",
                                  style: context.textTheme.labelLarge?.copyWith(
                                    color:
                                        context.colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                          trailingWidget: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Row(
                              spacing: context.gutterTiny,
                              mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        context.colorScheme.onPrimaryContainer,
                                  ),

                                  child: Assets.icons.github.image(
                                    height: 16,
                                  ),
                                ),

                                Text(
                                  "GitHub",
                                  style: context.textTheme.labelLarge?.copyWith(
                                    color:
                                        context.colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
