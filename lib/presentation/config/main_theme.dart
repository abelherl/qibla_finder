import 'package:qibla_finder/shared/constant_styling.dart';
import 'package:flutter/material.dart';

ThemeData mainTheme() {
  final fontFamily = 'Quicksand';
  final primaryColor = Color(0xFF3FC876);
  final accentColor = Color(0xFF107BD2);

  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline2: base.headline2.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline3: base.headline3.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline4: base.headline4.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: Colors.white,
      ),
      headline5: base.headline5.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline6: base.headline6.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.white,
      ),
      bodyText1: base.bodyText1.copyWith(
        fontFamily: fontFamily,
        color: Colors.white,
      ),
      bodyText2: base.bodyText2.copyWith(
        fontFamily: fontFamily,
        color: Colors.white,
      ),
      subtitle1: base.subtitle1.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      subtitle2: base.subtitle2.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      button: base.subtitle2.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      caption: base.caption.copyWith(
        fontFamily: fontFamily,
        color: aLightTextColor,
      ),
    );
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      primaryColor: primaryColor,
      backgroundColor: aBackgroundColor,
      accentColor: accentColor);
}
