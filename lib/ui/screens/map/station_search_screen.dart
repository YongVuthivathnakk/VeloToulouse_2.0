import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/ui/screens/map/view_model/map_view_model.dart';
import 'package:velotoulouse/ui/screens/map/widgets/map_station_tile.dart';
import 'package:velotoulouse/ui/screens/map/widgets/search_text_field.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class StationSearchScreen extends StatefulWidget {
  const StationSearchScreen({super.key});

  @override
  State<StationSearchScreen> createState() => _StationSearchScreenState();
}

class _StationSearchScreenState extends State<StationSearchScreen> {
  String query = "";
  
  @override
  Widget build(BuildContext context) {
    final vm = context.read<MapViewModel>();
    final stations = vm.stationsState.data ?? [];

    final filtered = stations.where((s) {
      return s.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.grey50,
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              Expanded(
                child: SearchTextField(
                  query: query,
                  onChanged: (value) {
                    setState(() => query = value);
                  },
                  onClear: () {
                    setState(() => query = "");
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                final station = filtered[index];

                return MapStationTile(
                  station: station,
                  onTap: () => Navigator.pop(context, station),
                  available: vm.getAvailableBikes(station),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
