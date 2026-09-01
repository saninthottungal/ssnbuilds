import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF99CC99),
      primary: const Color(0xFF99CC99),
      secondary: const Color(0xFF2D3D2D),
      tertiary: const Color(0xFFFFFFFF),
      brightness: .dark,
    ),
    fontFamily: 'jet_brains_mono',
  );
}
