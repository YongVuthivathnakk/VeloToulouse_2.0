import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/models/bike.dart';
import 'package:velotoulouse/ui/screens/bike_booking/bike_booking_screen.dart';
import 'package:velotoulouse/ui/screens/station_details/view_model/station_details_view_model.dart';
import 'package:velotoulouse/ui/screens/station_details/widgets/slot_tile.dart';
import 'package:velotoulouse/ui/widgets/status_badge.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class StationDetailsContent extends StatelessWidget {
  const StationDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<StationDetailsViewModel>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Station Information", style: AppText.h2),
      ),

      body: StreamBuilder(
        stream: Rx.combineLatest2(vm.stationStream, vm.bikeStream, (
          Station? station,
          List<Bike> bikes,
        ) {
          if (station == null) return null;

          final bikeMap = {for (var b in bikes) b.id: b};

          return (station: station, bikes: bikeMap);
        }),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data =
              snapshot.data as ({Station station, Map<String, Bike> bikes});
          final station = data.station;
          final bikeMap = data.bikes;

          return Padding(
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
                        '${station.name} - ${station.location.name}',
                        style: AppText.h2,
                      ),
                      Text(station.location.street, style: AppText.h3),

                      Row(
                        children: [
                          StatusBadge(
                            label: 'Available',
                            dotIndicator: true,
                            number: station.slots.where((slot) {
                              final bike = bikeMap[slot.bikeId];
                              return slot.bikeId != null &&
                                  (bike?.isAvailable ?? false);
                            }).length,
                            backgroundColor: AppColors.primaryLight,
                            textColor: AppColors.primaryDark,
                          ),
                          const SizedBox(width: 15),
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

                const Divider(),
                Expanded(
                  child: ListView(
                    children: station.slots.map((slot) {
                      final bike = bikeMap[slot.bikeId];

                      final statusText = slot.bikeId == null
                          ? "Empty"
                          : (bike?.isAvailable ?? false)
                          ? "Available"
                          : "Booked";

                      return SlotTile(
                        slotNumber: slot.slotNumber,
                        isOccupied: slot.bikeId != null,
                        statusLabel: statusText,
                        onTap: (slot.bikeId != null)
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BikeBookingScreen(slot: slot),
                                  ),
                                );
                              }
                            : null,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
