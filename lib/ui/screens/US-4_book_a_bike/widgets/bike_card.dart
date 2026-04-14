import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velotoulouse/ui/themes/theme.dart';
import 'package:velotoulouse/ui/widgets/status_badge.dart';

class BikeCard extends StatelessWidget {
  final String slotId;
  final int slotNumber;
  const BikeCard({super.key, required this.slotId, required this.slotNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.largeRadius,
        border: Border.all(color: AppColors.grey300),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12), 
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.grey50,
              borderRadius: AppRadius.largeRadius,
            ),
            child: Column(
              children: [
                Text(
                  'Slot $slotNumber',
                  style: AppText.h2.copyWith(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Icon(Icons.pedal_bike, size: 66, color: AppColors.primaryDark),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bike', style: AppText.h3),
                StatusBadge(
                  label: 'Available',
                  dotIndicator: false,
                  backgroundColor: AppColors.primaryLight,
                  textColor: AppColors.primaryDark,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
