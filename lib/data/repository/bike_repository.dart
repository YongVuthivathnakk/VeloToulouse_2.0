import 'package:velotoulouse/models/bike.dart';

abstract class BikeRepository {
  Future<Bike?> getBike(String id);
  
}
