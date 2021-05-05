import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qibla_finder/presentation/config/main_theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  init

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme().primaryColor,
      body: Parent(
        style: ParentStyle()
          ..linearGradient(
            colors: [mainTheme().primaryColor.withAlpha(100), mainTheme().accentColor.withAlpha(120)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/SVG/qibla_finder_logo.svg',
                color: Colors.white,
                height: 150,
              ),
              SizedBox(height: 15),
              Text(
                'Qibla Finder',
                style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
