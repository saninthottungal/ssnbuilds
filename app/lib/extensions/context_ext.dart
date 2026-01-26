import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ContextExt on BuildContext {
  //* responsive framework
  ResponsiveBreakpointsData get responsiveData =>
      ResponsiveBreakpoints.of(this);

  bool get isMobile => responsiveData.isMobile;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
