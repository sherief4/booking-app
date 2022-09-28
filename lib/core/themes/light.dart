import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const mainColor = Color(0xFF4FBE9E);
const backgroundColor = Color(0xFFF7F7F7);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: backgroundColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Josefin',
      fontSize: 30.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Josefin',
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Josefin',
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Josefin',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
  ),
);
