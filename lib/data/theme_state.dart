import 'package:flutter/material.dart';

/// Class representing the state of the app.
///
/// The state is determined by [isDarkTheme].
class ThemeState {
  /// Whether the app is in dark mode.
  final bool isDarkTheme;
  final Locale appLocale;

  ThemeState({this.isDarkTheme, this.appLocale});

  // Initial state of the app.
  ///
  /// By default, keeps dark mode off if no preference is given.
  factory ThemeState.init(bool isDarkTheme, Locale locale) =>
      ThemeState(isDarkTheme: isDarkTheme, appLocale: locale);
}
