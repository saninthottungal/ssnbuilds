import 'package:flutter/material.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/widgets/content_wrapper.dart';

class BuildsPage extends StatelessWidget {
  const BuildsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
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
      ],
    );
  }
}
