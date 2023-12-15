import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.amber,
  ),
  scaffoldBackgroundColor: Colors.white10,
  dividerColor: Colors.white10,
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
  primarySwatch: Colors.amber,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
  ),
);