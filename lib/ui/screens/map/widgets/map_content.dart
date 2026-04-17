import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:velotoulouse/ui/screens/map/view_model/map_view_model.dart';
import 'package:velotoulouse/ui/screens/map/widgets/map_search_bar.dart';
import 'package:velotoulouse/ui/screens/map/widgets/station_marker.dart';
import 'package:velotoulouse/ui/screens/map/station_search_screen.dart';
import 'package:velotoulouse/ui/screens/station_details/station_details_screen.dart';
import 'package:velotoulouse/ui/themes/theme.dart';
import 'package:velotoulouse/utils/async_value_state.dart';

class MapContent extends StatelessWidget {
  
  const MapContent({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = MapController();
    final vm = context.watch<MapViewModel>();
    final isLoading = vm.bikeCountsState.state == AsyncValueState.loading;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.stationsState.state == AsyncValueState.error) {
      return Center(
        child: Text(
          vm.stationsState.error.toString(),
          style: AppText.body.copyWith(color: AppColors.error),
        ),
      );
    }

    final stations = vm.stationsState.data ?? [];

    return Scaffold(
      backgroundColor: AppColors.grey50,

      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(11.5564, 104.9282),
              initialZoom: 13,
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  LatLng(11.45, 104.80),
                  LatLng(11.70, 105.05),
                ),
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: "com.example.velotoulouse",
              ),

              MarkerLayer(
                markers: stations.map((station) {
                  return Marker(
                    width: 100,
                    height: 100,
                    point: LatLng(
                      station.location.coords.latitude,
                      station.location.coords.longitude,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                StationDetailsScreen(station: station),
                          ),
                        );
                      },
                      child: StationMarker(
                        station: station,
                        availableBikes: isLoading
                            ? 0
                            : vm.getBikeCount(station.id),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          MapSearchBar(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider.value(
                    value: vm,
                    child: const StationSearchScreen(),
                  ),
                ),
              );

              if (result != null) {
                mapController.move(
                  LatLng(
                    result.location.coords.latitude,
                    result.location.coords.longitude,
                  ),
                  16,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
