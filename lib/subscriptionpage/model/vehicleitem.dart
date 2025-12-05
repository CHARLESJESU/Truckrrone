
class VehicleItem {
  final String vehicleNumber;
  final String price;
  bool isSelected;

  VehicleItem({
    required this.vehicleNumber,
    required this.price,
    this.isSelected = false,
  });
}