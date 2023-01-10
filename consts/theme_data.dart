import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme) {
    return isDarkTheme
        ? ThemeData(
            splashColor: Color(0xFF000000),
            secondaryHeaderColor: Color.fromARGB(255, 94, 94, 94),
            primaryColor: Colors.grey[700],
            scaffoldBackgroundColor: Color(0xFF252525),
            colorScheme: ColorScheme.light(
                primary: Colors.white, secondary: Color(0xFFF3A953)),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          )
        : ThemeData(
            splashColor: Color(0xFF000000),
            secondaryHeaderColor: Color.fromARGB(255, 94, 94, 94),
            primaryColor:Colors.grey[300],
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.light(
                primary: Color(0xFF252525),
                secondary: Color.fromARGB(255, 71, 181, 255)),
            iconTheme: IconThemeData(
              color: Color(0xFF252525),
            ),
          );
  }
}
