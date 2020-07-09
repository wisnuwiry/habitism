import 'package:flutter/material.dart';
import 'package:habitism/data/route_paths.dart';
import 'package:habitism/pages/home.dart';
import 'package:habitism/pages/settings.dart';

const String initialRoute = 'home';

class Router {
  static dynamic routes() => {
        initialRoute: (BuildContext context) => Home(),
        RoutePaths.settings: (BuildContext context) => Settings(),
      };
}
