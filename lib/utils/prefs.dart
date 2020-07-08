import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provides saving the theme upon quitting the app.
SharedPreferences _userPrefs;

/// Get instance of preferences object
SharedPreferences get prefs => _userPrefs;

/// Get or create new object for storing theme preference.
void loadPrefs() async {
  _userPrefs = await SharedPreferences.getInstance();
}

/// Update and save theme preference.
void updatePrefs(bool isDarkTheme, Locale locale) async {
  await _userPrefs.setBool('isDarkTheme', isDarkTheme);
  if (locale == const Locale('ar')) {
    await _userPrefs.setString('language_code', 'ar');
  } else {
    await _userPrefs.setString('language_code', 'en');
  }
}
