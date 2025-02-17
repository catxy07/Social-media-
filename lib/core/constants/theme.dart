import 'package:flutter/material.dart';

ThemeData CustomLightTheme = ThemeData(
  useMaterial3: true, primaryColor: Colors.white,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
    fontSize: 20,
  color: Colors.black,
    ),
    bodyLarge: TextStyle(
    fontSize: 15,
    color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold
    ),
  

  ),

  filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.orange,
        textStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      )
  ),
);