class Bike {
  final String id;
  String stationId;
  bool availabilityStatus;

  Bike({
    required this.id,
    required this.stationId,
    this.availabilityStatus = true,
  });

  Bike copyWith({
    String? stationId, 
    bool? availabilityStatus
    }){
    return Bike(
      id: id,
      stationId: stationId ?? this.stationId,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
    );
  }
}
