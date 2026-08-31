import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getAppTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF99CC99),
      brightness: .dark,
    ),
    textTheme: GoogleFonts.jetBrainsMonoTextTheme(),
  );
}
