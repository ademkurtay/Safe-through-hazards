import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double dCheckPadding = 16;
const double dCheckLargePadding = 20;
const Color dCheckWhite = Colors.white;

const BorderRadius dCheckRadius = BorderRadius.all(Radius.circular(16));
const BorderRadius dCheckSmallRadius = BorderRadius.all(Radius.circular(8));

const String dCheckFont = 'SFProText';

const Color dCheckGrey = Color.fromRGBO(92, 92, 92, 1);

const Color dCheckBackColor = Color.fromRGBO(245, 245, 245, 1);
const Color dCheckCardColor = Color.fromRGBO(255, 255, 255, 1);
const Color dCheckAccentColor = Color.fromRGBO(77, 148, 255, 1);

const Color dCheckTextColor = Color.fromRGBO(13, 31, 47, 1);

class DCheckTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: dCheckBackColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            color: dCheckTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 34,
            fontFamily: dCheckFont)),
    dividerTheme: DividerThemeData(color: dCheckTextColor.withOpacity(0.2)),
    colorScheme: ColorScheme.fromSwatch(
        cardColor: dCheckCardColor,
        backgroundColor: dCheckBackColor,
        brightness: Brightness.light,
        errorColor: const Color.fromRGBO(242, 83, 84, 1),
        accentColor: dCheckAccentColor),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: dCheckTextColor,
          fontSize: 32,
          fontFamily: dCheckFont,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
        color: dCheckTextColor,
        fontSize: 24,
        fontFamily: dCheckFont,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: dCheckTextColor,
        fontSize: 20,
        fontFamily: dCheckFont,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
          color: dCheckTextColor,
          fontSize: 16,
          letterSpacing: 0,
          fontFamily: dCheckFont,
          fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(
          color: dCheckTextColor,
          fontSize: 14,
          letterSpacing: -0.15,
          fontFamily: dCheckFont,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
        color: dCheckTextColor,
        fontSize: 12,
        letterSpacing: 0,
        fontFamily: dCheckFont,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
