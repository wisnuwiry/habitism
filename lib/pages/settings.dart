import 'package:flutter/material.dart';
import 'package:habitism/data/app_localization.dart';
import 'package:habitism/provider/theme_provider.dart';
import 'package:habitism/ui/text.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => themeProvider.toggleTheme(),
              child: ResponsiveText(
                AppLocalizations.of(context).translate('change_theme'),
              ),
            ),
            InkWell(
              onTap: () => themeProvider.toggleLocale(const Locale('ar')),
              child: ResponsiveText('العربي'),
            ),
            InkWell(
              onTap: () => themeProvider.toggleLocale(const Locale('en')),
              child: ResponsiveText('English'),
            ),
          ],
        ),
      ),
    );
  }
}
