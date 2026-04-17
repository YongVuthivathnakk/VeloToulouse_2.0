class Bike {
  final String id;
  final bool isAvailable;

  Bike({
    required this.id,
    this.isAvailable = true,
  });

  Bike copyWith({
    bool? isAvailable
    }){
    return Bike(
      id: id,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
