import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? ThemeColors.darkTheme : ThemeColors.lightTheme;
  }
}

class ThemeColorsStorage {
  static Color primaryColor = Colors.blue;
  static Color lightBackgroundColor = Colors.white;
  static Color darkBackgroundColor = Color(0xFF00040F);
  static Color lightTextColor = Colors.black;
  static Color darkTextColor = Colors.white;
}

class ThemeColors {
  const ThemeColors._();
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: ThemeColorsStorage.primaryColor,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light, // Ensure brightness matches ThemeData
      surface: ThemeColorsStorage.lightBackgroundColor,
      primary: ThemeColorsStorage.primaryColor,
      background: ThemeColorsStorage.lightBackgroundColor,
    ),
    scaffoldBackgroundColor: ThemeColorsStorage.lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColorsStorage.lightBackgroundColor,
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(color: ThemeColorsStorage.lightTextColor),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: ThemeColorsStorage.primaryColor,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark, // Ensure brightness matches ThemeData
      surface: ThemeColorsStorage.darkBackgroundColor,
      primary: ThemeColorsStorage.primaryColor,
      background: ThemeColorsStorage.darkBackgroundColor,
    ),
    scaffoldBackgroundColor: ThemeColorsStorage.darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      labelLarge: TextStyle(color: ThemeColorsStorage.darkTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColorsStorage.darkBackgroundColor,
    ),
  );

  static Brightness get currentSystemBrightness => SchedulerBinding.instance.window.platformBrightness;
}

extension ThemeExtras on ThemeData {
  Color get navBarColor => brightness == Brightness.light ? const Color(0xffF0F0F0) : const Color(0xFF00040F);

  Color get textColor => brightness == Brightness.light ? const Color(0xFF403930) : const Color(0xFFFFF8F2);

  Color get secondaryColor => const Color(0xFFFE53BB);

  Gradient get serviceCard => brightness == Brightness.light ? grayWhite : grayBack;

  Gradient get contactCard => brightness == Brightness.light ? grayWhite : contactGradi;
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
