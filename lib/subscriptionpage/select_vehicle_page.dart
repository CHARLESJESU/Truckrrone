import 'package:flutter/material.dart';

import 'package:truckrrone/subscriptionpage/cart_page.dart';
import 'package:truckrrone/subscriptionpage/model/vehicleitem.dart';
import 'package:truckrrone/subscriptionpage/widget/appbar.dart';


class SelectVehiclePage extends StatefulWidget {
  const SelectVehiclePage({super.key});

  @override
  State<SelectVehiclePage> createState() => _SelectVehiclePageState();
}

class _SelectVehiclePageState extends State<SelectVehiclePage> {
  // List of 10 vehicles with prices
  final List<VehicleItem> vehicles = [
    VehicleItem(vehicleNumber: 'TN 12 HG 8797', price: '₹500'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8798', price: '₹550'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8799', price: '₹600'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8800', price: '₹450'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8801', price: '₹525'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8802', price: '₹575'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8803', price: '₹625'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8804', price: '₹475'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8805', price: '₹650'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8806', price: '₹500'),
  ];

  String getSelectedVehiclesText() {
    final selected = vehicles.where((v) => v.isSelected).toList();
    if (selected.isEmpty) return 'Select';
    if (selected.length == 1) return selected.first.vehicleNumber;
    return '${selected.length} vehicles selected';
  }

  void _showMultiSelectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text(
                'Select Vehicles',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: vehicles.length,
                  itemBuilder: (context, index) {
                    final vehicle = vehicles[index];
                    return CheckboxListTile(
                      value: vehicle.isSelected,
                      onChanged: (bool? value) {
                        setDialogState(() {
                          vehicle.isSelected = value ?? false;
                        });
                        setState(() {});
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            vehicle.vehicleNumber,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            vehicle.price,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: const Color(0xFF1C63AB),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF1C63AB),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Reusable App Bar
            Appbar(
              label: 'Subscription',
              onPressed: () => Navigator.pop(context),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Select Vehicle',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Select Vehicle Multi-Select Input
                    GestureDetector(
                      onTap: _showMultiSelectDialog,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFF8F8F8,
                          ), // Light grey background
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                getSelectedVehiclesText(),
                                style: TextStyle(
                                  color: vehicles.any((v) => v.isSelected)
                                      ? Colors.black
                                      : Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Continue Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(77, 21, 94, 149), // 0.3 * 255 ≈ 77
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Get selected vehicles
                    final selectedVehicles = vehicles
                        .where((v) => v.isSelected)
                        .toList();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CartPage(selectedVehicles: selectedVehicles),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1C63AB), // Dark blue color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
