import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.largeRadius),
        ),
        child: Text(label, style: AppText.h3.copyWith(color: AppColors.white)),
      ),
    );
  }
}
