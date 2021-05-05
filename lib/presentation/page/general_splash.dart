import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:qibla_finder/presentation/config/main_theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme().primaryColor,
      body: Parent(
        style: ParentStyle()
          ..opacity(0.3)
          ..linearGradient(
            colors: [mainTheme().primaryColor, mainTheme().accentColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
      ),
    );
  }
}
