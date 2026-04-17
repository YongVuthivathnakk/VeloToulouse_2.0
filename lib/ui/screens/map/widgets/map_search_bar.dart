import 'package:flutter/material.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class MapSearchBar extends StatelessWidget {
  final VoidCallback onTap;

  const MapSearchBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.mdR,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.grey500),
                  const SizedBox(width: 10),
                  Text(
                    "Search stations...",
                    style: AppText.body.copyWith(color: AppColors.grey500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
