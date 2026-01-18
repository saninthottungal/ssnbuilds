import 'package:flutter/material.dart';

class BuildsPage extends StatelessWidget {
  const BuildsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text("Projects Page"),
      ),
    );
  }
}
