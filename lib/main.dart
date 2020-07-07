import 'package:flutter/material.dart';
import 'package:habitism/google_fonts_setup.dart';
import 'package:habitism/pages/home.dart';
import 'package:habitism/utils/prefs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  loadPrefs();
  setupGoogleFont();
  runApp(Root());
  //  DevicePreview(
  //    builder: (_) => MyApp(),
  //  ),
  //);
}
