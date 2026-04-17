import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/ui/screens/bike_booking/bike_booking_screen.dart';
import 'package:velotoulouse/ui/screens/station_details/view_model/station_details_view_model.dart';
import 'package:velotoulouse/ui/screens/station_details/widgets/slot_tile.dart';
import 'package:velotoulouse/ui/widgets/status_badge.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class StationDetailsContent extends StatelessWidget {
  final Station selectedStation;
  const StationDetailsContent({super.key, required this.selectedStation});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<StationDetailsViewModel>();
    List<Widget> buildSlotTile() {
      return selectedStation.slots
          .where((slot) => vm.shouldDisplaySlot(slot))
          .map(
            (slot) => SlotTile(
              slotNumber: slot.slotNumber,
              isOccupied: slot.isOccupied,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BikeBookingScreen(slot: slot),
                ),
              ),
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
      body: Padding(
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
                              number: selectedStation.availableSlots,
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
