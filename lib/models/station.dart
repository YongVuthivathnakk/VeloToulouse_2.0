import 'package:velotoulouse/models/location.dart';
import 'package:velotoulouse/models/slot.dart';

class Station {
  final String id;
  final String name;
  final Location location;
  final List<Slot> slots;

  Station({
    required this.id,
    required this.name,
    required this.location,
    List<Slot>? slots,
  }) :slots = slots ?? [];

  Station copyWith({String? name, Location? location, List<Slot>? slots}) {
    return Station(
      id: id,
      name: name ?? this.name,
      location: location ?? this.location,
      slots: slots ?? this.slots,
    );
  }

  int get totalSlots => slots.length;

  int get availableSlots => slots.where((slot) => slot.bikeId == null).length;

  List<Slot> get occupiedSlots =>
      slots.where((slot) => slot.bikeId != null).toList();

  List<Slot> get emptySlots =>
      slots.where((slot) => slot.bikeId == null).toList();

}
