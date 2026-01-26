import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart';
import 'package:shared/shared.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/extensions/list_ext.dart';
import 'package:ssnbuilds/widgets/content_wrapper.dart';

final _leaveMessageKey = GlobalKey<FormState>();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
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
                    _WhatImDoingCard(),
                  ],
                );
              } else {
                return IntrinsicHeight(
                  child: Row(
                    spacing: context.gutter,
                    children: [
                      const Expanded(
                        child: _MyNameCardInfo(),
                      ),
                      const Expanded(
                        child: _WhatImDoingCard(),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),

        //* Leave a message
        const SliverToBoxAdapter(
          child: LeaveMessageCard(),
        ),
      ].separatedBy(const SliverToBoxAdapter(child: Gutter())),
    );
  }
}

class _MyNameCardInfo extends StatelessWidget {
  const _MyNameCardInfo();

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      leading: Icons.safety_divider_outlined,
      title: 'Hello World🎉',
      contentCrossAxisAlignment: .start,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            "For starters,",
            style: context.textTheme.headlineSmall,
          ),
          Text(
            "I am sanin T.",
            style: context.textTheme.displayLarge?.copyWith(
              fontFamily: 'minecraft_block',
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
          Text(
            "A Software Developer.",
            style: context.textTheme.headlineSmall,
          ),
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
      leading: Icons.toggle_on_outlined,
      title: 'What am i doing right now?',
      child: Column(
        spacing: context.gutterSmall,
        children: [
          const ContentWrapper(
            contentCrossAxisAlignment: .start,
            leading: Icons.book,
            title: "The book i'm reading",
            child: Text(
              '''"Code : The Hidden Language of Computer Hardware and Software" by Charles Petzold''',
            ),
          ),
          const ContentWrapper(
            contentCrossAxisAlignment: .start,
            leading: Icons.movie,
            title: "The Movie/Series i'm watching",
            child: Text("The Rookie SE04EP11"),
          ),
          const ContentWrapper(
            contentCrossAxisAlignment: .start,
            leading: Icons.auto_stories,
            title: "The topic i'm studying",
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text("API development using dart_frog"),
                Text("C programming basics"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LeaveMessageCard extends HookWidget {
  const LeaveMessageCard({super.key});

  Future<void> _publishMessage(AppMessage message) async {
    final url = 'http://localhost:8080/messages/';
    await post(
      Uri.parse(url),
      body: jsonEncode({
        'name': message.name,
        'message': message.message,
        'email': message.email,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final mailController = useTextEditingController();
    final messageController = useTextEditingController();

    return ContentWrapper(
      child: Form(
        key: _leaveMessageKey,
        child: Column(
          spacing: context.gutterSmall,
          children: [
            Text(
              "Leave a message",
              style: context.textTheme.headlineMedium?.copyWith(
                fontFamily: 'minecraft_block',
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
            TextFormField(
              controller: nameController,
              maxLines: 1,
              maxLength: 100,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'your name (required)',
              ),

              validator: (value) {
                if (value?.trim().isEmpty == true) {
                  return 'name cannot be empty';
                }
                return null;
              },
            ),
            TextFormField(
              controller: mailController,
              maxLines: 1,
              maxLength: 100,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'your mail (optional)',
              ),
            ),
            TextFormField(
              controller: messageController,
              maxLength: 600,
              minLines: 1,
              maxLines: 24,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'message (required)',
              ),
              validator: (value) {
                if (value?.trim().isEmpty == true) {
                  return 'message cannot be empty';
                }
                return null;
              },
            ),

            ElevatedButton(
              onPressed: () {
                final isOkay =
                    _leaveMessageKey.currentState?.validate() ?? true;
                if (!isOkay) return;

                // call api here
                final name = nameController.text;
                final mail = mailController.text.trim().isEmpty
                    ? null
                    : mailController.text;
                final message = messageController.text;

                _publishMessage(
                  AppMessage(
                    id: 1234,
                    name: name,
                    message: message,
                    email: mail,
                    createdAt: DateTime.now(),
                  ),
                );
              },
              child: const Text("send"),
            ),
          ],
        ),
      ),
    );
  }
}
