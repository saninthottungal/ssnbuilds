import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/content_const.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _DpAndBio(),
      ],
    );
  }
}

class _DpAndBio extends StatelessWidget {
  const _DpAndBio();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        spacing: context.gutter,
        children: [
          //* DP
          const _DP(),

          //* Bio
          const _Bio(),
        ],
      ),
    );
  }
}

class _DP extends StatelessWidget {
  const _DP();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.outline),
        ),
      ),
    );
  }
}

class _Bio extends StatelessWidget {
  const _Bio();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colorScheme.outline,
          ),
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.all(
            Radius.circular(context.gutterTiny),
          ),
        ),
        child: Column(
          mainAxisAlignment: .start,
          spacing: context.gutter,
          children: [
            //* Bio Header
            const _BioHeader(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.gutterSmall),
              child: Text(
                ContentConsts.about.bio,
                style: context.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BioHeader extends StatelessWidget {
  const _BioHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.gutterTiny),
        ),

        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.outline,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.gutterSmall,
        vertical: context.gutterTiny,
      ),
      child: Row(
        spacing: context.gutterTiny,
        children: [
          Icon(
            Icons.info,
            size: 14,
            color: context.colorScheme.onPrimaryContainer,
          ),
          Text(
            "Bio Log",
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
          const Spacer(),
          Text(
            "page 1 of 1",
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onPrimaryContainer.withValues(
                alpha: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
