import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository_mock.dart';
import 'package:velotoulouse/ui/screens/view_bike_at_a_station/view_model/view_bike_at_a_station_view_model.dart';
import 'package:velotoulouse/ui/screens/view_bike_at_a_station/widgets/view_bike_at_a_station_content.dart';
import 'package:velotoulouse/ui/states/station_state.dart';

class ViewBikeAtAStationScreen extends StatelessWidget {
  const ViewBikeAtAStationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ViewBikeAtAStationViewModel(
      bikeRepository: context.read<BikeRepository>(), 
      stationState: context.read<StationState>()),
      child: ViewBikeAtAStationContent()
    );
  }
}
