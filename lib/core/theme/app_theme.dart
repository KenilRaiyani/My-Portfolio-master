import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Define your custom colors
const Color primaryColor = Colors.blue;
const Color lightBackgroundColor = Colors.white;
const Color darkBackgroundColor = Color(0xFF00040F);
const Color lightTextColor = Colors.black;
const Color darkTextColor = Colors.white;

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? ThemeColors.darkTheme : ThemeColors.lightTheme;
  }
}

class ThemeColors {
  const ThemeColors._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light, // Ensure brightness matches ThemeData
      surface: lightBackgroundColor,
      primary: primaryColor,
      background: lightBackgroundColor,
    ),
    scaffoldBackgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: lightBackgroundColor,
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(color: lightTextColor),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark, // Ensure brightness matches ThemeData
      surface: darkBackgroundColor,
      primary: primaryColor,
      background: darkBackgroundColor,
    ),
    scaffoldBackgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      labelLarge: TextStyle(color: darkTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackgroundColor,
    ),
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;
}

extension ThemeExtras on ThemeData {
  Color get navBarColor =>
      brightness == Brightness.light ? const Color(0xffF0F0F0) : const Color(0xFF00040F);

  Color get textColor =>
      brightness == Brightness.light ? const Color(0xFF403930) : const Color(0xFFFFF8F2);

  Color get secondaryColor => const Color(0xFFFE53BB);

  Gradient get serviceCard =>
      brightness == Brightness.light ? grayWhite : grayBack;

  Gradient get contactCard =>
      brightness == Brightness.light ? grayWhite : contactGradi;
}

// Define your gradients (replace with actual gradient values)
final Gradient grayWhite = LinearGradient(
  colors: [Colors.grey, Colors.white],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final Gradient grayBack = LinearGradient(
  colors: [Colors.grey, Colors.black],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final Gradient contactGradi = LinearGradient(
  colors: [Colors.blue, Colors.purple],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);