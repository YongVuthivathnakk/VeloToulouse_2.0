import 'package:flutter/material.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class MapStationTile extends StatelessWidget {
  final Station station;
  final int available;
  final VoidCallback onTap;

  const MapStationTile({
    super.key,
    required this.station,
    required this.onTap,
    required this.available,
  });

  @override
  Widget build(BuildContext context) {
    final isEmpty = available == 0;

    return GestureDetector(
      onTap: onTap, 
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),

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

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isEmpty ? AppColors.grey300 : AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_on,
                color: isEmpty ? AppColors.grey500 : AppColors.primaryDark,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station.name,
                    style: AppText.h3.copyWith(
                      color: isEmpty ? AppColors.grey500 : AppColors.grey900,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Icon(
                        Icons.pedal_bike,
                        size: 16,
                        color: isEmpty
                            ? AppColors.error
                            : AppColors.secondaryDark,
                      ),
                      const SizedBox(width: 4),

                      Text(
                        isEmpty
                            ? "No bikes available"
                            : "$available bikes available",
                        style: AppText.caption.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isEmpty
                              ? AppColors.error
                              : AppColors.secondaryDark,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    station.location.street,
                    style: AppText.caption.copyWith(color: AppColors.grey500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
