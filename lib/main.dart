import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ssnbuilds/pages/about_page.dart';
import 'package:ssnbuilds/widgets/app_header.dart';

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
      home: const AppHeader(sliver: AboutPage()),
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

class AnimatedIntro extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const AnimatedIntro({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<AnimatedIntro> createState() => _AnimatedIntroState();
}

class _AnimatedIntroState extends State<AnimatedIntro> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: widget.duration,
      curve: Curves.easeInOut,
      child: AnimatedScale(
        scale: _isVisible ? 1.0 : 0.9,
        duration: widget.duration,
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}
