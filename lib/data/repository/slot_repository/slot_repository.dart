import 'package:velotoulouse/models/slot.dart';

abstract class SlotRepository {
  Future<Slot?> getSlotById(String slotId);
}