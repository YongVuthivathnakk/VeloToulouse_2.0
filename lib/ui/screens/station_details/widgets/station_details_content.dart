import 'package:flutter/material.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/ui/screens/station_details/widgets/slot_tile.dart';
import 'package:velotoulouse/ui/screens/station_details/widgets/status_badge.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class ViewBikeAtAStationContent extends StatelessWidget {
  final Station selectedStation;
  const ViewBikeAtAStationContent({super.key, required this.selectedStation});

  @override
  Widget build(BuildContext context) {
    //final vm = context.watch<ViewBikeAtAStationViewModel>();
    //final station = vm.stationState.selectedStation;

    List<Widget> buildSlotTile() {
      return selectedStation.slots
          .map(
            (slot) => SlotTile(
              slotNumber: slot.slotNumber,
              isOccupied: slot.isOccupied,
            ),
          )
          .toList();
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
      body: 
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${selectedStation.name} - ${selectedStation.location.name}',
                          style: AppText.h2,
                        ),
                        Text(selectedStation.location.street, style: AppText.h3),
                        Row(
                          children: [
                            StatusBadge(
                              label: 'Available',
                              dotIndicator: true,
                              number: selectedStation.occupiedSlots.length,
                              backgroundColor: AppColors.primaryLight,
                              textColor: AppColors.primaryDark,
                            ),
                            SizedBox(width: 15),
                            StatusBadge(
                              label: 'Empty',
                              dotIndicator: true,
                              number: selectedStation.availableSlots,
                              backgroundColor: AppColors.grey50,
                              textColor: AppColors.grey500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Expanded(child: ListView(children: buildSlotTile())),
                ],
              ),
            ),
    );
  }
}
