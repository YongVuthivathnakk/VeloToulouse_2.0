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
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.mdR,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isEmpty ? AppColors.grey300 : AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.directions_bike,
                color: isEmpty ? AppColors.grey500 : AppColors.primaryDark,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          station.name,
                          style: AppText.h3.copyWith(
                            color: isEmpty
                                ? AppColors.grey500
                                : AppColors.grey900,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isEmpty
                              ? AppColors.error.withOpacity(0.1)
                              : AppColors.secondary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          isEmpty ? "No available bikes" : "$available bikes",
                          style: AppText.caption.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isEmpty
                                ? AppColors.error
                                : AppColors.secondaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: AppColors.grey500,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          station.location.street,
                          style: AppText.caption.copyWith(
                            color: AppColors.grey500,
                          ),
                        ),
                      ),
                    ],
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
