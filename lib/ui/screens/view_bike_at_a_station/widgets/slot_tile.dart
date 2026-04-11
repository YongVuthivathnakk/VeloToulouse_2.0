
import 'package:flutter/material.dart';
import 'package:velotoulouse/ui/screens/view_bike_at_a_station/widgets/status_badge.dart';
import 'package:velotoulouse/ui/themes/theme.dart'; 
class SlotTile extends StatelessWidget {
  final int slotNumber;
  final bool isOccupied;

  const SlotTile({
    super.key,
    required this.slotNumber,
    required this.isOccupied,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.mdR,
        border: Border.all(color: AppColors.grey300),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isOccupied ? AppColors.primaryLight : AppColors.grey300,
              borderRadius: AppRadius.mdR,
            ),
            child: Icon(
              isOccupied ? Icons.directions_bike : Icons.lock_open,
              color: isOccupied ? AppColors.primary : AppColors.grey500,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Slot $slotNumber",
                  style: AppText.body.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  isOccupied ? "Bike" : "Empty Dock",
                  style: AppText.caption.copyWith(color: AppColors.grey500),
                ),
              ],
            ),
          ),
          StatusBadge(
            label: isOccupied ? "Available" : "Empty",
            dotIndicator: false,
            backgroundColor: isOccupied
                ? AppColors.primaryLight
                : AppColors.grey50, 
            textColor: isOccupied 
                ? AppColors.primaryDark
                : AppColors.grey500,
          ),
        ],
      ),
    );
  }
}


