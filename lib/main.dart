import 'package:flutter/material.dart';
import 'package:habitism/constant.dart';
import 'package:habitism/home.dart';

void main() {
//  DevicePreview(
//    builder: (_) => MyApp(),
//  ),
//);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        //locale: DevicePreview.of(context).locale,
        //builder: DevicePreview.appBuilder,
        title: 'Habitism',
        theme: ThemeData(
          primaryColor: kPrimaryColor,

          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      );
}
