import 'package:velotoulouse/data/mockdata.dart';
import 'package:velotoulouse/data/repository/slot_repository/slot_repository.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/station.dart';

class SlotRepositoryMock implements SlotRepository {
  @override
  Future<Slot?> getSlotById(String slotId) async {
    try {
      return MockData.stations
          .expand((station) => station.slots)
          .firstWhere((slot) => slot.id == slotId);
    } catch (e) {
      throw Exception("Slot not found: $slotId");
    }
  }
}
