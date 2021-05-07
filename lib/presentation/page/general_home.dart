import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qibla_finder/presentation/config/main_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme().primaryColor,
      body: Parent(
        style: ParentStyle()
          ..linearGradient(
            colors: [
              mainTheme().primaryColor.withAlpha(100),
              mainTheme().accentColor.withAlpha(120)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        child: Center(),
      ),
    );
  }
}
