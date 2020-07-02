import 'package:flutter/material.dart';
import 'package:habitism/google_fonts_setup.dart';
import 'package:habitism/screens/home.dart';
import 'package:habitism/shared/themes.dart';

void main() {
//  DevicePreview(
//    builder: (_) => MyApp(),
//  ),
//);
  WidgetsFlutterBinding.ensureInitialized();
  setupGoogleFont();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
        //locale: DevicePreview.of(context).locale,
        //builder: DevicePreview.appBuilder,
        title: 'Habitism',
        theme: buildLightTheme(),
        home: Home(),
      );
}
