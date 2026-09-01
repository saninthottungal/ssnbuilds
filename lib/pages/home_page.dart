import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
import 'package:ssnbuilds/widgets/app_footer.dart';
import 'package:ssnbuilds/widgets/content_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (context.isMobile) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: context.gutter,
                    children: const [
                      _MyNameCardInfo(),
                      _CurrentProject(),
                      _WhatImDoingCard(),
                      _RecentActivityCard(),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisSize: .min,
                    spacing: context.gutter,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          spacing: context.gutter,
                          children: [
                            Expanded(
                              child: Column(
                                spacing: context.gutterSmall,
                                children: [
                                  const Expanded(child: _MyNameCardInfo()),
                                  const _CurrentProject(),
                                ],
                              ),
                            ),
                            const Expanded(
                              child: _WhatImDoingCard(),
                            ),
                          ],
                        ),
                      ),

                      const _RecentActivityCard(),
                    ],
                  );
                }
              },
            ),
          ),

          //* footer
          const SliverFillRemaining(
            hasScrollBody: false,
            child: AppFooter(),
          ),
        ],
      ),
    );
  }
}

class _MyNameCardInfo extends StatelessWidget {
  const _MyNameCardInfo();

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      leading: Icons.terminal,
      title: 'Hello World🎉',
      contentCrossAxisAlignment: .start,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            "For starters,",
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          Text(
            "I AM SANIN T.",
            style: context.textTheme.displayLarge?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: .w800,
              fontFamily: 'space_grotesk',
            ),
          ),
          Text(
            "A Software Developer.",
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),

          Padding(
            padding: .symmetric(vertical: context.gutterSmall),
            child: Text(
              '"Scratching through the soul of system, duh."',
              style: context.textTheme.bodyMedium?.copyWith(
                backgroundColor: context.colorScheme.secondaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentProject extends StatelessWidget {
  const _CurrentProject();

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      leading: Icons.build,
      title: 'Currently working on',
      contentCrossAxisAlignment: .start,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            crossAxisAlignment: .start,
            spacing: context.gutterSmall,
            children: [
              Container(
                decoration: ShapeDecoration(
                  shape: RoundedSuperellipseBorder(
                    borderRadius: .circular(context.gutterTiny),
                  ),
                  color: Colors.white,
                ),
                child: Assets.logo.hostpro.image(
                  height: 40,
                  width: 40,
                ),
              ),

              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Hostpro events",
                    style: context.textTheme.titleMedium?.copyWith(
                      fontFamily: 'minecraft_block',
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                  ),

                  const Text(
                    "An event management app",
                  ),
                ],
              ),
            ],
          ),

          // Text(
          //   "For starters,",
          //   style: context.textTheme.headlineSmall,
          // ),
          // Text(
          //   "I am sanin T.",
          //   style: context.textTheme.displayLarge?.copyWith(
          //     fontFamily: 'minecraft_block',
          //     color: context.colorScheme.onPrimaryContainer,
          //   ),
          // ),
          // Text(
          //   "A Software Developer.",
          //   style: context.textTheme.headlineSmall,
          // ),
        ],
      ),
    );
  }
}

class _WhatImDoingCard extends StatelessWidget {
  const _WhatImDoingCard();

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      leading: Icons.autorenew,
      title: 'What am i doing right now?',
      child: Column(
        spacing: context.gutterSmall,
        children: [
          const ContentWrapperMini(
            contentCrossAxisAlignment: .start,
            leading: Icons.book,
            title: "The book i'm reading",
            child: Text(
              '''"Code : The Hidden Language of Computer Hardware and Software" by Charles Petzold''',
            ),
          ),
          const ContentWrapperMini(
            contentCrossAxisAlignment: .start,
            leading: Icons.movie,
            title: "The Movie/Series i'm watching",
            child: Text("Daredevil SE01EP02"),
          ),
          const ContentWrapperMini(
            contentCrossAxisAlignment: .start,
            leading: Icons.auto_stories,
            title: "The topic i'm studying",
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text("Building backend using Serverpod"),
                Text("Building sockets with C"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentActivityCard extends StatelessWidget {
  const _RecentActivityCard();

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      leading: Icons.code,
      title: 'Recent Activity',
      contentCrossAxisAlignment: .start,
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 4,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: r"sanin@ssnbuilds:~$",
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                const TextSpan(text: ' git log --oneline -n 3'),
              ],
            ),
            textAlign: .start,
          ),
          const Text('2d8e2g5 [docs] updated privacy and policy for Hostpro'),
          const Text(
            '1c9d0f3 [fix] phone number error while signing up in Hostpro fixed',
          ),
          const Text('4b8e1a2 [feat] ssnbuilds.in portfolio revamp completed'),
          const Text('7a2f3c1 [feat] implemented QR code scanning in Hostpro'),

          Text(
            r"sanin@ssnbuilds:~$",
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
