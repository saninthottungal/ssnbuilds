import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/widgets/content_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: IntrinsicHeight(
            child: Row(
              spacing: context.gutter,
              children: [
                Expanded(
                  child: ContentWrapper(
                    leading: Icons.safety_divider_outlined,
                    title: 'Hello World🎉',
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
                Expanded(
                  child: ContentWrapper(
                    leading: Icons.toggle_on_outlined,
                    title: 'What am i doing right now?',
                    child: Column(
                      spacing: context.gutterSmall,
                      children: [
                        const ContentWrapper(
                          contentCrossAxisAlignment: .start,
                          leading: Icons.book,
                          title: "The book i'm reading",
                          child: Text(
                            '''"Code : The Hidden Language of Computer Hardware and Software" by Charles Petzold''',
                          ),
                        ),
                        const ContentWrapper(
                          contentCrossAxisAlignment: .start,
                          leading: Icons.movie,
                          title: "The Movie/Series i'm watching",
                          child: Text("The Rookie SE04EP11"),
                        ),
                        const ContentWrapper(
                          contentCrossAxisAlignment: .start,
                          leading: Icons.auto_stories,
                          title: "The topic i'm studying",
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("API development using dart_frog"),
                              Text("C programming basics"),
                            ],
                          ),
                        ),
                      ],
                    ),
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
