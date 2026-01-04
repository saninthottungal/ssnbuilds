import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  //* Logo
                  Image.network(
                    'web/assets/logo/text_logo.png',
                    width: 200,
                    height: 50,
                  ),

                  //* Spacer
                  const Spacer(),
                ],
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(title: Text('Item $index'));
          },
        ),
      ),
    );
  }
}
