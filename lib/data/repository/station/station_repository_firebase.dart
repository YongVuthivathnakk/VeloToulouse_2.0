import 'package:firebase_database/firebase_database.dart';
import 'package:velotoulouse/data/dtos/station_dto.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/models/station.dart';

class StationRepositoryFirebase implements StationRepository {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  @override
  Stream<List<Station>> watchStations() {
    final ref = _db.child('stations');

    return ref.onValue.map((event) {
      final data = event.snapshot.value;

      if (data == null) return [];

      final map = Map<String, dynamic>.from(data as Map);

      return map.entries.map((entry) {
        return StationDto.fromJson(
          entry.key,
          Map<String, dynamic>.from(entry.value),
        );
      }).toList();
    });
  }

  @override
  Future<Station?> getStation(String id) async {
    final snapshot = await _db.child('stations/$id').get();

    if (!snapshot.exists) return null;

    return StationDto.fromJson(
      id,
      Map<String, dynamic>.from(snapshot.value as Map),
    );
  }
  
  @override
  Future<List<Station>> getAllStation() {
    // TODO: implement getAllStation
    throw UnimplementedError();
  }
}
