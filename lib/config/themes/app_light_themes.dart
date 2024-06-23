import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color.fromARGB(255, 255, 255, 255);
const Color primaryLightColorLight = Color(0xFF8de9d5);
const Color primaryColorLight = Color(0xFF32c4c0);

class ThemeClass {
  static Color lightprimaryColor = Color.fromARGB(255, 255, 255, 255);
  static Color primaryLightColorLight = const Color(0xFF8de9d5);
  static Color primaryColorLight = const Color.fromARGB(255, 120, 49, 135);
  static Color darkprimaryColor = const Color.fromARGB(255, 46, 45, 45);
  static Color objectColor1 = const Color(0xFF32c4c0);
  static Color objectColor2 = const Color.fromARGB(255, 52, 20, 58);
  static Color gradLight1 = Colors.white;
  static Color gradLight2 = Colors.grey;

  static ThemeData lightTheme = ThemeData(
      primaryColor: ThemeClass.lightprimaryColor,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.nunito(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 30,
            fontWeight: FontWeight.w800),
        titleMedium: GoogleFonts.nunito(
            color: ThemeClass.objectColor1,
            fontSize: 23,
            fontWeight: FontWeight.w700),
        titleSmall: GoogleFonts.nunito(
            color: ThemeClass.primaryLightColorLight,
            fontSize: 17,
            fontWeight: FontWeight.w300),
        labelSmall: GoogleFonts.nunito(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
        bodySmall: GoogleFonts.poppins(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        labelLarge: GoogleFonts.montserrat(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      ),
      colorScheme: const ColorScheme.light().copyWith(
          background: ThemeClass.primaryLightColorLight,
          primary: ThemeClass.lightprimaryColor,
          secondary: ThemeClass.primaryLightColorLight,
          tertiary: ThemeClass.objectColor1,
          onTertiary: ThemeClass.gradLight1,
          onTertiaryContainer: ThemeClass.gradLight2,
          surface: Colors.white,
          onBackground: ThemeClass.gradLight1));

  static ThemeData darkTheme = ThemeData(
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      textTheme: GoogleFonts.nunitoTextTheme().copyWith(
          titleLarge: GoogleFonts.nunito(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
          titleMedium: GoogleFonts.nunito(
              color: ThemeClass.objectColor2,
              fontSize: 23,
              fontWeight: FontWeight.w700),
          titleSmall: GoogleFonts.nunito(
              color: ThemeClass.primaryColorLight,
              fontSize: 17,
              fontWeight: FontWeight.w300),
          bodySmall: GoogleFonts.poppins(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          labelSmall: GoogleFonts.nunito(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 15,
              fontWeight: FontWeight.w400),
          labelLarge: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
      colorScheme: const ColorScheme.light().copyWith(
          background: ThemeClass.primaryColorLight,
          primary: ThemeClass.darkprimaryColor,
          secondary: ThemeClass.primaryColorLight,
          tertiary: ThemeClass.objectColor2,
          onTertiary: ThemeClass.darkprimaryColor,
          onTertiaryContainer: ThemeClass.gradLight1,
          surface: ThemeClass.darkprimaryColor,
          onBackground: ThemeClass.gradLight2));
}
