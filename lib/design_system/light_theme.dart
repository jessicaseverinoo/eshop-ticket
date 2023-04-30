import 'package:eshop_ticket/design_system/colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: primary,
  brightness: Brightness.light,
  backgroundColor: white,
  dividerColor: light,
  errorColor: danger,
  scaffoldBackgroundColor: white,
  appBarTheme: const AppBarTheme(
    color: primary,
    elevation: 0,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: primary,
    elevation: 0,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    disabledColor: light,
    height: 52,
    buttonColor: primary,
    textTheme: ButtonTextTheme.normal,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStateProperty.all(primary),
      elevation: MaterialStateProperty.all(0),
      animationDuration: const Duration(seconds: 1),
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 52)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: primary),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: white,
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStateProperty.all(white),
      foregroundColor: MaterialStateProperty.all(primary),
      elevation: MaterialStateProperty.all(0),
      animationDuration: const Duration(seconds: 1),
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 52)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: primary),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: primary,
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    textColor: white,
    iconColor: white,
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      fontWeight: FontWeight.w800,
    ),
    headline2: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 22,
      fontWeight: FontWeight.w800,
    ),
    headline3: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20,
      fontWeight: FontWeight.w800,
    ),
    headline4: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 18,
      fontWeight: FontWeight.w800,
    ),
    headline5: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
    headline6: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
  ),
);
