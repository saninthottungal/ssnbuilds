import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/content_const.dart';
import 'package:ssnbuilds/constants/url_const.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
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
            "Flutter Builds",
            style: context.textTheme.titleLarge?.copyWith(
              fontFamily: 'minecraft_block',
            ),
          ),
        ),

        //* flutter projects grid
        SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.isMobile ? 1 : 2,
            mainAxisSpacing: context.gutter,
            crossAxisSpacing: context.gutter,
            mainAxisExtent: 270,
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
        const SliverToBoxAdapter(child: Gutter.large()),

        SliverToBoxAdapter(
          child: Text(
            "C Builds",
            style: context.textTheme.titleLarge?.copyWith(
              fontFamily: 'minecraft_block',
            ),
          ),
        ),

        //* C projects grid
        SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.isMobile ? 1 : 2,
            mainAxisSpacing: context.gutter,
            crossAxisSpacing: context.gutter,
            mainAxisExtent: 270,
          ),
          itemCount: _cProjects.length,
          itemBuilder: (context, index) {
            final project = _cProjects[index];

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

final List<ProjectModel> _cProjects = [
  const ProjectModel(
    leading: Icons.close,
    title: 'Tic-Tac-Toe',
    description: 'A fun Tic-Tac-Toe game',
    githubUrl: URLConsts.cTicTacToeGithub,
  ),
  const ProjectModel(
    leading: Icons.cut,
    title: 'Rock-Paper-Scissors',
    description: 'A fun Rock-Paper-Scissors game',
    githubUrl: URLConsts.cRockPaperScissorsGithub,
  ),
];
