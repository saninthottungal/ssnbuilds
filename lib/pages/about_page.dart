import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/content_const.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/extensions/list_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
import 'package:ssnbuilds/widgets/content_wrapper.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _DpAndBio(),

        //* Skills and Technologies
        const _SkillsAndTech(),

        //* Experience
        const _Experience(),
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
      child: ContentWrapper(
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
      child: ContentWrapper(
        leading: Icons.info_outline,
        title: "Bio Log",
        child: Text(
          ContentConsts.about.bio,
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class _SkillsAndTech extends StatelessWidget {
  const _SkillsAndTech();

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      leading: Icons.handyman_outlined,
      title: 'Skills and Techs',
      child: Wrap(
        children: List.generate(
          ContentConsts.about.skillsAndTechs.length,
          (index) {
            return ContentWrapper(
              padding: EdgeInsets.all(context.gutterTiny),
              margin: EdgeInsets.all(context.gutterTiny),

              child: Text(
                ContentConsts.about.skillsAndTechs[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Experience extends StatelessWidget {
  const _Experience();

  @override
  Widget build(BuildContext context) {
    // return const ContentWrapper(
    //   leading: Icons.work_outline,
    //   title: 'Experience',
    //   child: Column(
    //     children: [
    //       ContentWrapper(title: 'Flutter Developer', child: SizedBox()),
    //     ],
    //   ),
    // );

    return const SizedBox();
  }
}

class _Education extends StatelessWidget {
  const _Education();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
