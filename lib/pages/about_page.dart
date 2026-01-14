import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/content_const.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/extensions/list_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _DpAndBio(),

        //* Skills and Technologies
        const _SkillsAndTech(),
      ].separatedBy(const Gutter()),
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
        padding: EdgeInsets.all(context.gutterSmall),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          border: Border.all(color: context.colorScheme.outline),
          borderRadius: BorderRadius.all(
            Radius.circular(context.gutterTiny),
          ),
        ),

        child: Column(
          spacing: context.gutterTiny,
          children: [
            //* Dp Character Image
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.onPrimary,
                  width: 4,
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: context.gutterLarge),
              child: Image.asset(
                Assets.images.dpCharacter.path,
              ),
            ),

            Text(
              "sanin t.",
              style: context.textTheme.titleLarge?.copyWith(
                fontFamily: 'minecraft_block',
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),

            const Text("experience: 2 yrs"),
            const Text("role: flutter dev"),
            const Text("learning: C Programming"),
            const Text("timezone: IST (UTC +5:30)"),
          ],
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
            Icons.info_outline,
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

class _SkillsAndTech extends StatelessWidget {
  const _SkillsAndTech();

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Container(
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
                  Icons.handyman_outlined,
                  size: 14,
                  color: context.colorScheme.onPrimaryContainer,
                ),
                Text(
                  "Skills and Techs",
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
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.gutterSmall,
              vertical: context.gutter,
            ),
            child: Wrap(
              children: List.generate(
                ContentConsts.about.skillsAndTechs.length,
                (index) {
                  return Container(
                    padding: EdgeInsets.all(context.gutterTiny),
                    margin: EdgeInsets.all(context.gutterTiny),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainer,
                      border: Border.all(color: context.colorScheme.outline),
                      borderRadius: BorderRadius.all(
                        Radius.circular(context.gutterTiny),
                      ),
                    ),
                    child: Text(
                      ContentConsts.about.skillsAndTechs[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
