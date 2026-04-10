import 'package:velotoulouse/models/location.dart';

class Station {
  String id;
  String name;
  int totalSlots;
  Map<int, String> occupiedSlots = {};
  Location locationPosition;

  Station({
    required this.id,
    required this.name,
    required this.totalSlots,
    required this.locationPosition,
  });

  int get availableSlots => totalSlots - occupiedSlots.length;

  void addBikeSlot(int slotNumber, String bikeId) {
    if (slotNumber < 1 || slotNumber > totalSlots) {
      print("Invalid slot number!");
      return;
    }
    if (occupiedSlots.containsKey(slotNumber)) {
      print("Slot $slotNumber is already occupied!");
      return;
    }
    occupiedSlots[slotNumber] = bikeId;
    print("Bike $bikeId parked at slot $slotNumber.");
  }

  void removeBikeSlot(int slotNumber) {
    if (slotNumber < 1 || slotNumber > totalSlots) {
      print("Invalid slot number!");
      return;
    }
    if (!occupiedSlots.containsKey(slotNumber)) {
      print("Slot $slotNumber is already empty!");
    }
    occupiedSlots.remove(slotNumber);
    print("Slot $slotNumber is now free.");
  }

  List<int> getAvaliableSlot() {
    List<int> availableSlots = [];
    for (int i = 1; i <= totalSlots; i++) {
      if (!occupiedSlots.containsKey(i)) {
        availableSlots.add(i);
      }
    }
    return availableSlots;
  }
}
