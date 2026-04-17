import 'package:velotoulouse/models/bike.dart';

abstract class BikeRepository {
  Future<List<Bike>> getAllBike();
  Future<Bike?> getBike(String id);
  Future<Bike?> updateBikeAvailability(String bikeId, bool status);
  Stream<List<Bike>> watchBikes();
}
