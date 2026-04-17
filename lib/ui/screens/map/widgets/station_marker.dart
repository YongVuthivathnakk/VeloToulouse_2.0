import 'package:flutter/material.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class StationMarker extends StatelessWidget {
  final Station station;
  final int availableBikes;

  const StationMarker({super.key, required this.station, required this.availableBikes});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.location_pin,
              size: 50,
              color: availableBikes > 0 ? AppColors.primary : AppColors.grey300,
            ),

            Positioned(
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: availableBikes > 0 ? AppColors.primaryDark : AppColors.grey500,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "$availableBikes",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppRadius.mdR,
          ),
          child: Text(
            station.name,
            style: AppText.caption,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
