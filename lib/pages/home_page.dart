import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Image.network(
                  'web/assets/logo/text_logo.png',
                  width: 200,
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
