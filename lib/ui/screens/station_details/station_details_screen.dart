import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/models/station.dart';
import 'package:velotoulouse/ui/screens/station_details/view_model/station_details_view_model.dart';
import 'package:velotoulouse/ui/screens/station_details/widgets/station_details_content.dart';

class StationDetailsScreen extends StatelessWidget {
  final String stationId;
  const StationDetailsScreen({super.key, required this.stationId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          StationDetailsViewModel(
            bikeRepository: context.read<BikeRepository>(), 
            stationId: stationId, 
            stationRepository: context.read<StationRepository>()),
      child: StationDetailsContent(),
    );
  }
}
