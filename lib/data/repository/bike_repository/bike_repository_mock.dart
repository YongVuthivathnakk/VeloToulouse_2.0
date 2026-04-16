import 'package:velotoulouse/data/mockdata.dart';
import 'package:velotoulouse/data/repository/bike_repository/bike_repository.dart';
import 'package:velotoulouse/models/bike.dart';

class BikeRepositoryMock implements BikeRepository {
  final MockData mockData;
  BikeRepositoryMock({required this.mockData});

  @override
  Future<Bike?> getBike(String id) async {
    try {
      return mockData.bikes.firstWhere((bike) => bike.id == id);
    } catch (e) {
      throw Exception("There is no bike matched with this id");
    }
  }

  @override
  Future<Bike?> updateBikeAvailability(String bikeId, bool status) async {
    try {
      final index = mockData.bikes.indexWhere((bike) => bike.id == bikeId);

      if (index == -1) {
        throw Exception("Bike not found");
      }

      final bike = mockData.bikes[index];

      final updatedBike = bike.copyWith(isAvailable: status);

      mockData.bikes[index] = updatedBike;

      return updatedBike;
    } catch (e) {
      throw Exception("Failed to update bike availability");
    }
  }

  @override
  Future<List<Bike>> getAllBike() async {
    return mockData.bikes;
  }
}
