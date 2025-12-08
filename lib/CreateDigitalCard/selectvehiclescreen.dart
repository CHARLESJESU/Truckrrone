import 'package:flutter/material.dart';
import 'package:proper_multiselect_search_dropdown/proper_multiselect_search-dropdown.dart';

import 'package:truckrrone/CreateDigitalCard/widget/appbar.dart';


import 'package:truckrrone/CreateDigitalCard/widget/ccms_balance.dart';
import 'package:truckrrone/CreateDigitalCard/widget/vehicledetails.dart';
import 'package:truckrrone/Route/approutes.dart';

class Selectvehiclescreen extends StatefulWidget {
  const Selectvehiclescreen({Key? key}) : super(key: key);

  @override
  State<Selectvehiclescreen> createState() => _SelectvehiclescreenState();
}

class _SelectvehiclescreenState extends State<Selectvehiclescreen> {
  String?   selectedVehicle;
  bool isViewingSelected = false;
  List<String> selectedVehicles = [];

  final List<String> vehicles = [
    'TN52/GH571',
    'TN01/AB1234',
    'TN45/CD5678',
  ];

  void toggleViewSelected() {
    setState(() {
      isViewingSelected = !isViewingSelected;
    });
  }

  void removeVehicle(String vehicle) {
    setState(() {
      selectedVehicles.remove(vehicle);
      if (selectedVehicles.isEmpty) {
        isViewingSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Custom Appbar
            Appbar(
              title: 'Create Digital Card',
              onPressed: () => Navigator.pop(context),
              centerTitle: true,
              textColor: Colors.black,
              appBarBackgroundColor: Colors.white,
            ),
            // Main Content
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CCMS Balance Card
                      CcmsBalance(
                        title: 'CCMS Balance',
                        subtitle: '₹ 1,250.00',
                        buttontext: 'Recharge',
                        onRecharge: () {
                          // Handle recharge action
                        },
                        ImagePath: 'assets/ccmsbalance/wallet.png',
                      ),
                      const SizedBox(height: 24),

                      // Select Vehicles Label
                      RichText(
                        text: const TextSpan(
                          text: 'Select Vehicles ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                color: Colors. red,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Vehicle Dropdown and View Selected Button in Stack
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Dropdown
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: ProperSingleSelectDropdown(
                              items: const [
                                ['TN52/GH571'],
                                ['TN01/AB1234'],
                                ['TN45/CD5678'],
                              ],
                              hintText: 'Select Vehicles',
                              enableSearch: false,
                              onSelectionChanged: (selectedItems) {
                                if (selectedItems != null && selectedItems.isNotEmpty && selectedItems[0] != null && selectedItems[0].isNotEmpty) {
                                  setState(() {
                                    String vehicle = selectedItems[0][0];
                                    if (! selectedVehicles.contains(vehicle)) {
                                      selectedVehicles.add(vehicle);
                                    }
                                  });
                                  print('Selected: $selectedItems');
                                }
                              },
                            ),
                          ),

                          // View/Hide Selected Button
                          Positioned(
                            right: 0,
                            top: 0,
                            child: ElevatedButton(
                              onPressed: selectedVehicles.isEmpty ?  null : toggleViewSelected,
                              style: ElevatedButton. styleFrom(
                                backgroundColor: const Color(0xFF1565C0),
                                foregroundColor: Colors.white,
                                disabledBackgroundColor: Colors. grey[400],
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                isViewingSelected ? 'Hide Selected' : 'View Selected',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Display Selected Vehicles
                      if (isViewingSelected && selectedVehicles.isNotEmpty) ...[


                        // Vehicle Details Card
                        Vehicledetails(),
                        const SizedBox(height: 24),

                        // Cancel and Submit Buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  // Handle cancel
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors. grey[700],
                                  side: BorderSide(color: Colors.grey[300]!),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoutes.ccmstocardtransfercreatedigitalcard);

                                  // Handle submit
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1565C0),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],

                    ],
                  ),
                ),

            ),
          ],
        ),
      ),
    );
  }

}