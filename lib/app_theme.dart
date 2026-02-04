import 'package:flutter/material.dart';

class Light {
  Color mainColor = Color(0xFF0E3A99);
  Color disable = Color(0xFFB9B9B9);
  Color mainText = Color(0xFF1C1C1C);
  Color secText = Color(0xFF686868);
  Color background = Color(0xFFF4F7FF);
  Color inputs = Color(0xFFFFFFFF);
  Color stoke = Color(0xFFF0F0F0);
  Color red = Color(0xFFFF3232);
}

class Dark {
  Color mainColor = Color(0xFF457AED);
  Color disable = Color(0xFFB9B9B9);
  Color mainText = Color(0xFFFFFFFF);
  Color secText = Color(0xFFD6D6D6);
  Color background = Color(0xFF000F30);
  Color inputs = Color(0xFF001440);
  Color stoke = Color(0xFF002D8F);
  Color red = Color(0xFFFF3232);
}

class AppTheme {
  static Light light = Light();
  static Dark dark = Dark();

  static ThemeData lightTheme = ThemeData(
    primaryColor: light.mainColor,

    scaffoldBackgroundColor: light.background,

    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: light.inputs,
      hintStyle: TextStyle(
        color: light.secText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: light.stoke),
        borderRadius: BorderRadius.circular(16),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: light.stoke),
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    listTileTheme: ListTileThemeData(
      tileColor: light.inputs,
      minTileHeight: 0,
      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),), 
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: light.mainText,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: light.inputs,
      selectedItemColor: light.mainColor,
      unselectedItemColor: light.disable,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: light.mainColor,
      foregroundColor: light.inputs,
      shape: CircleBorder(),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: light.mainColor,
        foregroundColor: light.inputs,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: light.mainColor,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          decoration: .underline
        ),
      ),
    ),

    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: light.mainColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: light.mainText,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: light.mainText,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: light.secText,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: dark.mainColor,

    scaffoldBackgroundColor: dark.background,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: dark.inputs,
      selectedItemColor: dark.mainColor,
      unselectedItemColor: dark.disable,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: dark.mainColor,
      foregroundColor: dark.inputs,
      shape: CircleBorder(),
    ),

    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: dark.mainColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: dark.mainText,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: dark.mainText,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: dark.secText,
      ),
    ),
  );
}
