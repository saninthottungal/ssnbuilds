import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';

class GithubLogoText extends StatelessWidget {
  const GithubLogoText({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Row(
        spacing: context.gutterTiny,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.onPrimaryContainer,
            ),

            child: Assets.icons.github.image(
              height: 16,
            ),
          ),

          Text(
            "GitHub",
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
