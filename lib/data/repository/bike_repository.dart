import 'package:velotoulouse/models/bike.dart';

abstract class BikeRepository {
  Future<List<Bike>> getAllBikeFromAStation(String stationId);
  Future<Bike?> getBike(String id);
  
}
