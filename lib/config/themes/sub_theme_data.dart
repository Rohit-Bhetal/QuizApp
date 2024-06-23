import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin SubThemedata {
  TextTheme getTextThemes() {
    return GoogleFonts.nunitoSansTextTheme(const TextTheme(
        bodyLarge: TextStyle(fontWeight: FontWeight.w800),
        bodyMedium: TextStyle(fontWeight: FontWeight.w600),
        bodySmall: TextStyle(fontWeight: FontWeight.w400)));
  }
}
