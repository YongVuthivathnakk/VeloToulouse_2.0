import 'package:velotoulouse/data/mockdata.dart';
import 'package:velotoulouse/data/repository/bike_repository/bike_repository.dart';
import 'package:velotoulouse/models/bike.dart';

class BikeRepositoryMock implements BikeRepository {
  @override
  Future<Bike?> getBike(String id) async {
    try {
      return MockData.bikes.firstWhere((bike) => bike.id == id);
    } catch (e) {
      throw Exception("There is no bike matched with this id");
    }
  }
}
