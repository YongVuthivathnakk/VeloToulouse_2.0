import 'package:velotoulouse/models/bike.dart';

class BikeDto {
  static const String stationIdKey = 'stationId';
  static const String availabilityStatusKey = 'availabilityStatus';

  static Bike fromJson(String id, Map<dynamic, dynamic> json) {
    assert(json[stationIdKey] is String);
    assert(json[availabilityStatusKey] is bool);
    return Bike(
      id: id,
      stationId: json[stationIdKey],
      availabilityStatus: json[availabilityStatusKey],
    );
  }

  static Map<String, dynamic> toJson(Bike bike) {
    return {
      stationIdKey: bike.stationId,
      availabilityStatusKey: bike.availabilityStatus,
    };
  }
}
