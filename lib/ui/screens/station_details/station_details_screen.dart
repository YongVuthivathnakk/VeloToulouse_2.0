import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/ui/screens/station_details/view_model/view_bike_at_a_station_view_model.dart';
import 'package:velotoulouse/ui/screens/station_details/widgets/station_details_content.dart';
import 'package:velotoulouse/ui/states/station_state.dart';

class StationDetailsScreen extends StatelessWidget {
  final Station station;
  const StationDetailsScreen({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return ViewBikeAtAStationContent(selectedStation: station);
  }
}
