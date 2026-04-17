class Slot {
  final String id;
  final int slotNumber;
  final String? bikeId;
  final String stationId;

  Slot({required this.id, required this.slotNumber, required this.stationId, this.bikeId});

  bool get isOccupied => bikeId != null;

  Slot copyWith({String? bikeId, bool clearBike = false}) {
    return Slot(
      id: id,
      stationId: stationId,
      slotNumber: slotNumber,
      bikeId: clearBike ? null : bikeId ?? this.bikeId,
    );
  } // clearBike mean to remove the bike from that slot so it becomes empty.
}
