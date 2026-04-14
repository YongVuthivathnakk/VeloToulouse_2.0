import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class AccessOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const AccessOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.mdR,
          border: Border.all(color: AppColors.primaryDark),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
              ),
              child: Icon(icon, color: AppColors.primaryDark, size: 25),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppText.h3Bold),
                  Text(
                    subtitle,
                    style: AppText.label.copyWith(color: AppColors.grey300),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.primaryDark),
          ],
        ),
      ),
    );
  }
}
