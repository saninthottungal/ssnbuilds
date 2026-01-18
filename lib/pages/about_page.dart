import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/content_const.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/extensions/list_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
import 'package:ssnbuilds/widgets/content_wrapper.dart';
import 'package:ssnbuilds/widgets/social_media_row.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const _DpAndBio(),

        //* Skills and Technologies
        const _SkillsAndTech(),

        //* Experience and Education
        const _ExperienceAndEducation(),
      ].separatedBy(const SliverToBoxAdapter(child: Gutter())),
    );
  }
}

class _DpAndBio extends StatelessWidget {
  const _DpAndBio();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: LayoutBuilder(
        builder: (context, _) {
          if (context.isMobile) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: context.gutter,
              children: const [
                _DP(),
                _Bio(),
              ],
            );
          } else {
            return IntrinsicHeight(
              child: Row(
                spacing: context.gutter,
                children: [
                  //* DP
                  const Expanded(child: _DP()),

                  //* Bio
                  const Expanded(
                    flex: 2,
                    child: _Bio(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class _DP extends StatelessWidget {
  const _DP();

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      width: double.infinity,
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
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 200,
                maxWidth: 200,
              ),
              child: Image.asset(
                Assets.images.dpCharacter.path,
              ),
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

          //social media row
          const SocialMediaRow(),
        ],
      ),
    );
  }
}

class _Bio extends StatelessWidget {
  const _Bio();

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      leading: Icons.info_outline,
      title: "Bio Log",
      trailing: "page 1 of 1",
      child: Text(
        ContentConsts.about.bio,
        style: context.textTheme.bodyLarge,
      ),
    );
  }
}

class _SkillsAndTech extends StatelessWidget {
  const _SkillsAndTech();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ContentWrapper(
        leading: Icons.handyman_outlined,
        title: 'Skills and Techs',
        child: Wrap(
          alignment: WrapAlignment.center,
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
      ),
    );
  }
}

class _ExperienceAndEducation extends StatelessWidget {
  const _ExperienceAndEducation();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: LayoutBuilder(
        builder: (context, _) {
          if (context.isMobile) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: context.gutter,
              children: const [
                //* Experience
                _Experience(),

                //* Education
                _Education(),
              ],
            );
          } else {
            return IntrinsicHeight(
              child: Row(
                spacing: context.gutter,
                children: [
                  //* Experience
                  const Expanded(child: _Experience()),

                  //* Education
                  const Expanded(child: _Education()),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class _Experience extends StatelessWidget {
  const _Experience();

  @override
  Widget build(BuildContext context) {
    return const ContentWrapper(
      leading: Icons.work_outline,
      title: 'Experience',
      child: Column(
        children: [
          ContentWrapper(
            title: 'Flutter Developer',
            contentCrossAxisAlignment: .start,
            trailing: 'june 2024 - present',
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text("Company: Paiteq pvt limited"),
                Text("Employment status : Full-time"),
                Text("Location: Remote"),
                Text("Working on Nyburs - An intuitive Social media app"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Education extends StatelessWidget {
  const _Education();

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      leading: Icons.menu_book_rounded,
      title: 'Education',
      child: Column(
        spacing: context.gutterSmall,
        children: [
          const ContentWrapper(
            title: "Bachelor's degree",
            contentCrossAxisAlignment: .start,
            trailing: 'nov 2021 - apr 2024',
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text("Institution: Calicut University"),
                Text("Major: B.Sc in Computer Science"),
                Text("Minor: Discrete Mathematics"),
                Text("Location: Malappuram, Kerala"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
