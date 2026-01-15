import 'package:flutter/material.dart';

class Light {
  static Color mainColor = Color(0xFF0E3A99);
  static Color disable = Color(0xFFB9B9B9);
  static Color mainText = Color(0xFF1C1C1C);
  static Color secText = Color(0xFF686868);
  static Color background = Color(0xFFF4F7FF);
  static Color inputs = Color(0xFFFFFFFF);
  static Color stoke = Color(0xFFF0F0F0);
  static Color red = Color(0xFFFF3232);
}

class Dark {
  static Color mainColor = Color(0xFF457AED);
  static Color disable = Color(0xFFB9B9B9);
  static Color mainText = Color(0xFFFFFFFF);
  static Color secText = Color(0xFFD6D6D6);
  static Color background = Color(0xFF000F30);
  static Color inputs = Color(0xFF001440);
  static Color stoke = Color(0xFF002D8F);
  static Color red = Color(0xFFFF3232);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Light.background,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Light.inputs,
      selectedItemColor: Light.mainColor,
      unselectedItemColor: Light.disable,
    )
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Dark.background,
  );
}
