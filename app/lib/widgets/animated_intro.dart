import 'package:flutter/material.dart';

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
