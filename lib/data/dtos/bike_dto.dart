import 'package:velotoulouse/models/bike.dart';

class BikeDto {
  static const String idKey = 'id';
  static const String isAvailableKey = 'isAvailable';

  static Bike fromJson(String id, Map<dynamic, dynamic> json) {
    assert(json[isAvailableKey] is bool);
    return Bike(id: id, isAvailable: json[isAvailableKey] ?? true);
  }

  static Map<String, dynamic> toJson(Bike bike) {
    return {isAvailableKey: bike.isAvailable};
  }
}
