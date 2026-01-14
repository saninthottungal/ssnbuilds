import 'package:flutter/material.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _DpAndBio(),
      ],
    );
  }
}

class _DpAndBio extends StatelessWidget {
  const _DpAndBio();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 400,
          width: 300,
          color: context.colorScheme.onSurface,
        ),
      ],
    );
  }
}
