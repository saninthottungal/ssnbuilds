import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ssnbuilds/pages/app_container.dart';
import 'package:ssnbuilds/widgets/animated_intro.dart';

void main() {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
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
          seedColor: const Color(0xff3b8527),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,

        fontFamily: 'minecraft',
      ),
      home: const AppContainer(),
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 700, name: MOBILE),
            const Breakpoint(start: 701, end: double.infinity, name: TABLET),
          ],
          child: ColoredBox(
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.gutter),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: AnimatedIntro(child: child!),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
