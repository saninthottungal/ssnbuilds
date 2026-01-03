import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ssnbuilds",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff3b8527),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,

        fontFamily: 'minecraft',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
