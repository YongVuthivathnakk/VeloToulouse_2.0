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
  static const Color primary = Color(0xFF84B179);
  static const Color primaryDark = Color(0xFF6A9460);
  static const Color primaryLight = Color(0xFFD4E8D1);

  static const Color secondary = Color(0xFFFFB38A);
  static const Color secondaryDark = Color(0xFFE8955E);
  static const Color secondaryLight = Color(0xFFFFE8D8);

  // Semantic
  static const Color error = Color(0xFFE05252);
  static const Color success = Color(0xFF84B179);
  static const Color warning = Color(0xFFFFB38A);
  static const Color info = Color(0xFF5B9BD5);

  // Neutral
  static const Color grey900 = Color(0xFF1A1C19);
  static const Color grey500 = Color(0xFF6B7066);
  static const Color grey300 = Color(0xFFCDD4C8);
  static const Color grey50 = Color(0xFFF4F6F3);
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
  static const BorderRadius mdR = BorderRadius.all(Radius.circular(md));
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
