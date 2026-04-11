import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ═══════════════════════════════════════════════════════
//  PedalGo Design System - Light Theme Only
//  Primary:   #84B179 (Forest Green)
//  Secondary: #FFB38A (Sunrise Peach)
// ═══════════════════════════════════════════════════════

class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFFA2CB8B);
  static const Color primaryDark = Color(0xFF84B179);
  static const Color primaryLight = Color(0xFFC7EABB);

  static const Color secondary = Color(0xFFFFD6B8);
  static const Color secondaryDark = Color(0xFFFFB38A);
  static const Color secondaryLight = Color(0xFFFFF1E6);

  // Semantic
  static const Color error = Color(0xFFE05252);
  static const Color success = Color(0xFF84B179);
  static const Color warning = Color(0xFFFFB38A);
  static const Color info = Color(0xFF5B9BD5);

  // Neutral
  static const Color grey900 = Color(0xFF1C1C1E);
  static const Color grey500 = Color(0xFF8E8E93);
  static const Color grey300 = Color(0xFFC7C7CC);
  static const Color grey50 = Color(0xFFF2F2F7);
  static const Color white = Color(0xFFFFFFFF);
}

class AppText {
  AppText._();

  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static const TextStyle label = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.8,
  );
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

class AppRadius {
  AppRadius._();
  static const double md = 10;
  static const double large = 20;
  static const BorderRadius mdR = BorderRadius.all(Radius.circular(md));
  static const BorderRadius largeRadius = BorderRadius.all(
    Radius.circular(large),
  );
}

ThemeData get lightTheme => ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'DM Sans',
  scaffoldBackgroundColor: AppColors.grey50,

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.grey900,
    surface: Colors.white,
    onSurface: AppColors.grey900,
    error: AppColors.error,
  ),

  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: AppColors.grey900,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      textStyle: AppText.button,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdR),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.grey500,
      textStyle: AppText.button,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: AppRadius.mdR),
  ),

  textTheme: const TextTheme(
    displayLarge: AppText.h1,
    displayMedium: AppText.h2,
    bodyMedium: AppText.body,
    labelLarge: AppText.button,
  ),
);
