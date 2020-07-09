import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habitism/data/app_localization.dart';
import 'package:habitism/google_fonts_setup.dart';
import 'package:habitism/provider/theme_provider.dart';
import 'package:habitism/router.dart';
import 'package:habitism/ui/themes.dart';
import 'package:habitism/utils/prefs.dart';
import 'package:provider/provider.dart';

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

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: themeProvider.state.appLocale,
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('ar', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: 'Habitism',
          theme: themeProvider.state.isDarkTheme
              ? buildDarkTheme()
              : buildLightTheme(),
          initialRoute: initialRoute,
          routes: Router.routes(),
        );
      },
    );
  }
}
