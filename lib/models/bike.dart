class Bike {
  String id;
  String stationId;
  bool availabilityStatus;

  Bike({
    required this.id,
    required this.stationId,
    this.availabilityStatus = true,
  });

  
}
