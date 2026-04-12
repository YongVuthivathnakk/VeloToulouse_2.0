import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repository/bike_repository/bike_repository.dart';
import 'package:velotoulouse/data/repository/bike_repository/bike_repository_mock.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository.dart';
import 'package:velotoulouse/data/repository/station_repository/station_repository_mock.dart';
import 'package:velotoulouse/main_common.dart';
import 'package:velotoulouse/ui/states/station_state.dart';

List<InheritedProvider> get devProviders {
  return [
    Provider<BikeRepository>(create: (_) => BikeRepositoryMock()),
    Provider<StationRepository>(create: (_) => StationRepositoryMock()),
    ChangeNotifierProvider<StationState>(create: (context) => StationState(stationRepository: context.read<StationRepository>())),
  ];
}

void main() {
  mainCommon(devProviders);
}
