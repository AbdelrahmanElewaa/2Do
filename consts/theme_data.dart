import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme) {
    return ThemeData(


         splashColor: Color(0xFF000000),
        secondaryHeaderColor: Color.fromARGB(255, 94, 94, 94),
        primaryColor:isDarkTheme ? Colors.grey[700]: Colors.white,
        scaffoldBackgroundColor: isDarkTheme ? Color(0xFF252525): Colors.white,
        colorScheme: ColorScheme.light(
            primary: isDarkTheme ?Colors.white: Color(0xFF252525),
            secondary: Color.fromARGB(255, 71, 181, 255)),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
    );
  }
}
