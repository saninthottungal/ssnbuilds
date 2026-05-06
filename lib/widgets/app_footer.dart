import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/widgets/social_media_row.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
