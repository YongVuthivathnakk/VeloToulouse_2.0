import 'package:velotoulouse/models/location.dart';

class Station {
  final String id;
  final String name;
  final int totalSlots;
  final Map<int, String> occupiedSlots;
  final Location locationPosition;

  Station({
    required this.id,
    required this.name,
    required this.totalSlots,
    required this.locationPosition,
    Map<int, String>? occupiedSlots,
  }) : occupiedSlots = occupiedSlots ?? {} ;

    Station copyWith({
    String? name,
    int? totalSlots,
    Map<int, String>? occupiedSlots,
    Location? locationPosition,
  }) {
    return Station(
      id: id,
      name: name ?? this.name,
      totalSlots: totalSlots ?? this.totalSlots,
      occupiedSlots: occupiedSlots ?? this.occupiedSlots,
      locationPosition: locationPosition ?? this.locationPosition,
    );
  }

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
