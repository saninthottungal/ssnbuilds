import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/content_const.dart';
import 'package:ssnbuilds/constants/url_const.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
import 'package:ssnbuilds/models/project_model.dart';
import 'package:ssnbuilds/widgets/content_wrapper.dart';
import 'package:ssnbuilds/widgets/github_logo_text.dart';
import 'package:url_launcher/url_launcher.dart';

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
              style: context.textTheme.headlineMedium?.copyWith(
                fontFamily: 'minecraft_block',
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),

        //* spacing
        const SliverToBoxAdapter(child: Gutter()),

        SliverToBoxAdapter(
          child: Text(
            "Flutter",
            style: context.textTheme.titleLarge?.copyWith(
              fontFamily: 'minecraft_block',
            ),
          ),
        ),

        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: _flutterProjects.length,
          itemBuilder: (context, index) {
            final project = _flutterProjects[index];

            return ContentWrapper(
              leading: project.leading,
              title: project.title,
              trailingWidget: GithubLogoText(
                onTap: () {
                  //* Launch Github url
                  final url = Uri.parse(project.githubUrl);
                  launchUrl(url, mode: .externalApplication);
                },
              ),
              child: Text(project.description),
            );
          },
        ),

        //* spacing
        const SliverToBoxAdapter(child: Gutter()),

        SliverToBoxAdapter(
          child: ContentWrapper(
            leading: Icons.code,
            title: 'C',
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    spacing: context.gutterSmall,
                    children: [
                      //* Penny Box
                      Expanded(
                        child: ContentWrapper(
                          leading: Icons.close,
                          title: 'Tic-Tac-Toe',
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
                          child: const Column(
                            children: [
                              Text(
                                "A fun Tic-Tac-Toe game built using C",
                              ),
                            ],
                          ),
                        ),
                      ),

                      //* travel payouts
                      Expanded(
                        child: ContentWrapper(
                          leading: Icons.content_cut,
                          title: 'Rock-Paper-Scissors',
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
                          child: const Column(
                            children: [
                              Text(
                                'A simple Tic-Tac-Toe game built using C',
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

final List<ProjectModel> _flutterProjects = [
  ProjectModel(
    leading: Icons.monetization_on,
    title: 'Penny Box',
    description: ContentConsts.builds.pennyBoxDesc,
    githubUrl: URLConsts.pennyBoxGithub,
  ),
  ProjectModel(
    leading: Icons.flight,
    title: 'Fair Flights',
    description: ContentConsts.builds.fairFlightsDesc,
    githubUrl: URLConsts.fairFlightsGithub,
  ),
  ProjectModel(
    leading: Icons.bus_alert_outlined,
    title: 'iBus',
    description: ContentConsts.builds.iBusDesc,
    githubUrl: URLConsts.iBusGithub,
  ),
  ProjectModel(
    leading: Icons.cut,
    title: 'Flutter Stone-Paper-Scissors',
    description: ContentConsts.builds.flutterStonePaperScissorsDesc,
    githubUrl: URLConsts.flutterSPCGithub,
  ),
];
