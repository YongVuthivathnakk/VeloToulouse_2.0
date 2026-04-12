import 'package:velotoulouse/models/station.dart';

abstract class StationRepository {
  Future<List<Station>> getAllStation();
  Future<Station?> getStation(String id);
  Future<Station?> getStationBySlotId(String slotId);
}
