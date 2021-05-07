import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qibla_finder/presentation/config/main_theme.dart';
import 'package:qibla_finder/presentation/page/general_splash.dart';

import 'app.dart';
import '../config/app_localization.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      child: MaterialApp(
        title: 'Qibla Finder',
        theme: mainTheme(),
        home: SplashPage(),
        navigatorKey: App.main.router.navigatorKey,
        onGenerateRoute: App.main.router.generator(),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('sk', 'SK'),
        ],
        // localizationsDelegates: [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }
}
