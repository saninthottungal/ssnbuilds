import 'package:flutter/material.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/widgets/content_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: ContentWrapper(
            contentCrossAxisAlignment: .start,
            child: Column(
              crossAxisAlignment: .start,

              children: [
                Text(
                  "For starters,",
                  style: context.textTheme.headlineSmall,
                ),
                Text(
                  "I am sanin T.",
                  style: context.textTheme.displayLarge?.copyWith(
                    fontFamily: 'minecraft_block',
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
                Text(
                  "A Software Developer.",
                  style: context.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
