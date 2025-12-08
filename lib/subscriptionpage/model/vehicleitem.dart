class VehicleItem implements Comparable<VehicleItem> {
  final String vehicleNumber;
  final String price;
  // This state will be ignored by the search service's Set logic
  bool isSelected;

  VehicleItem({
    required this.vehicleNumber,
    required this.price,
    this.isSelected = false,
  });

  String get displayString => '$vehicleNumber ($price)';

  // IMPORTANT: Override equality and hashCode based ONLY on immutable keys
  // This is required for Set<VehicleItem> to work correctly.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VehicleItem &&
        other.vehicleNumber == vehicleNumber &&
        other.price == price;
  }

  @override
  int get hashCode => vehicleNumber.hashCode ^ price.hashCode;

  @override
  String toString() => displayString;

  @override
  int compareTo(VehicleItem other) {
    final byNumber = vehicleNumber.compareTo(other.vehicleNumber);
    if (byNumber != 0) return byNumber;
    return price.compareTo(other.price);
  }
}