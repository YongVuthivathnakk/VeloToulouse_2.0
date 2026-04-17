import 'package:flutter/material.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class AppButtonStyles {
  AppButtonStyles._();

  /// Primary button (default)
  static ButtonStyle primary({
    Color? backgroundColor,
    Color? foregroundColor,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 14),
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.primaryDark,
      foregroundColor: foregroundColor ?? Colors.white,
      elevation: 0,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  /// Secondary (outlined feel but still elevated)
  static ButtonStyle secondary() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.grey50,
      foregroundColor: AppColors.grey900,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  /// Danger / error button
  static ButtonStyle danger() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.error,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
