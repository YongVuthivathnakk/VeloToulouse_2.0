class Slot {
  final String id;
  final int slotNumber;
  final String? bikeId;

  Slot({required this.id, required this.slotNumber, this.bikeId});

  bool get isOccupied => bikeId != null;

  Slot copyWith({String? bikeId, bool clearBike = false}) {
    return Slot(
      id: id,
      slotNumber: slotNumber,
      bikeId: clearBike ? null : bikeId ?? this.bikeId,
    );
  } // clearBike mean to remove the bike from that slot so it becomes empty.
}
