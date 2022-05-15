import 'package:flutter/material.dart';

final myLightThemeData = ThemeData.from(
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.grey.shade700,
    background: Colors.grey.shade300,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.grey.shade700,
    ),
  ),
).copyWith(
  focusColor: Colors.grey.shade700,
  scaffoldBackgroundColor: Colors.grey.shade300,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Color(0xFF303030),
    centerTitle: true,
    elevation: 0,
  ),
  dividerTheme: DividerThemeData(
    color: Colors.grey.shade700,
    space: 20,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFF303030),
    unselectedLabelColor: Color(0xFF303030),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(horizontal: 5),
  ),
);

final myDarkThemeData = ThemeData.from(
  colorScheme: const ColorScheme.dark().copyWith(),
  textTheme: const TextTheme(),
).copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Color(0xFFFAFAFA),
    centerTitle: true,
    elevation: 0,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFFFAFAFA),
    unselectedLabelColor: Color(0xFFFAFAFA),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(horizontal: 5),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.grey.shade700,
  ),
);
