import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitism/ui/colors.dart';

ThemeData buildLightTheme() {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    textTheme: GoogleFonts.notoColorEmojiCompatTextTheme(),
    // This makes the visual density adapt to the platform that you run
    // the app on. For desktop platforms, the controls will be smaller and
    // closer together (more dense) than on mobile platforms.
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData buildDarkTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    textTheme: GoogleFonts.robotoTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
