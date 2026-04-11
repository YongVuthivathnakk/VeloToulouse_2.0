import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/ui/screens/view_bike_at_a_station/view_model/view_bike_at_a_station_view_model.dart';
import 'package:velotoulouse/ui/screens/view_bike_at_a_station/widgets/slot_tile.dart';
import 'package:velotoulouse/ui/screens/view_bike_at_a_station/widgets/status_badge.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class ViewBikeAtAStationContent extends StatelessWidget {
  const ViewBikeAtAStationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ViewBikeAtAStationViewModel>();
    final station = vm.stationState.selectedStation;

    List<Widget> buildSlotTile() {
      List<Widget> slotTile = [];
      for (int i = 1; i <= station!.totalSlots; i++) {
        final isOccupied = station.occupiedSlots.containsKey(i);
        slotTile.add(SlotTile(slotNumber: i, isOccupied: isOccupied));
      }
      return slotTile;
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Station Information", style: AppText.h2),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${station!.name} - ${station.locationPosition.name}',
                    style: AppText.h2,
                  ),
                  Text(station.locationPosition.street, style: AppText.h3),
                  Row(
                    children: [
                      StatusBadge(
                        label: 'Available',
                        dotIndicator: true,
                        number: station.occupiedSlots.length,
                        backgroundColor: AppColors.primaryLight,
                        textColor: AppColors.primaryDark,
                      ),
                      SizedBox(width: 15),
                      StatusBadge(
                        label: 'Empty',
                        dotIndicator: true,
                        number: station.availableSlots,
                        backgroundColor: AppColors.grey50,
                        textColor: AppColors.grey500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(child: ListView(
              children: buildSlotTile(),
            ))
          ],
        ),
      ),
    );
  }
}
