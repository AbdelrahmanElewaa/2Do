import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme) {
    return ThemeData(


         splashColor: Color(0xFF000000),
        secondaryHeaderColor: Color.fromARGB(255, 94, 94, 94),
        primaryColor: Color(0xFFF9F9F9),
        scaffoldBackgroundColor: isDarkTheme ? Color(0xFF252525): Colors.white,
        colorScheme: ColorScheme.light(
            primary: Color.fromARGB(255, 0, 0, 0),
            secondary: Color.fromARGB(255, 71, 181, 255)),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
    );
  }
}
