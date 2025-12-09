class FuelCardModel {
  // Basic Info
  String? title;
  String? name;
  String? mobile;
  String? nameOnCard;
  String? panCard;

  // Current Address
  String? currentStreet;
  String? currentCity;
  String? currentState;
  String? currentDistrict;
  String? currentZip;

  // Permanent Address
  String? permStreet;
  String? permCity;
  String? permState;
  String? permDistrict;
  String? permZip;

  FuelCardModel();

  // Copy current to permanent
  void copyCurrentToPermanent() {
    permStreet = currentStreet;
    permCity = currentCity;
    permState = currentState;
    permDistrict = currentDistrict;
    permZip = currentZip;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'name': name,
      'mobile': mobile,
      'name_on_card': nameOnCard,
      'pan_card': panCard,
      'current_street': currentStreet,
      'current_city': currentCity,
      'current_state': currentState,
      'current_district': currentDistrict,
      'current_zip': currentZip,
      'perm_street': permStreet,
      'perm_city': permCity,
      'perm_state': permState,
      'perm_district': permDistrict,
      'perm_zip': permZip,
    };
  }
}