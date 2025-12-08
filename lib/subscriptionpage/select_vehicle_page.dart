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
  // List of vehicles
  final List<VehicleItem> vehicles = [
    VehicleItem(vehicleNumber: 'TN 12 HG 8797', price: '₹500'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8798', price: '₹540'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8799', price: '₹610'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8800', price: '₹455'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8801', price: '₹525'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8802', price: '₹580'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8803', price: '₹635'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8804', price: '₹470'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8805', price: '₹660'),
    VehicleItem(vehicleNumber: 'TN 12 HG 8806', price: '₹505'),
  ];

  Set<VehicleItem> selectedVehicles = {};
  final TextEditingController searchController = TextEditingController();
  bool isDropdownExpanded = false;
  List<VehicleItem> filteredVehicles = [];

  @override
  void initState() {
    super.initState();
    filteredVehicles = List.from(vehicles);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  String getSelectedVehiclesText() {
    if (selectedVehicles.isEmpty) return 'Select';
    if (selectedVehicles.length == 1) return selectedVehicles.first.vehicleNumber;
    return '${selectedVehicles.length} vehicles selected';
  }

  void toggleDropdown() {
    setState(() {
      isDropdownExpanded = !isDropdownExpanded;
      if (!isDropdownExpanded) {
        searchController.clear();
        filteredVehicles = List.from(vehicles);
      }
    });
  }

  void filterVehicles(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredVehicles = List.from(vehicles);
      } else {
        final lowerQuery = query.toLowerCase();
        filteredVehicles = vehicles.where((item) {
          final lowerNumber = item.vehicleNumber.toLowerCase();
          return lowerNumber.contains(lowerQuery);
        }).toList();
      }
    });
  }

  void toggleSelection(VehicleItem item) {
    setState(() {
      if (selectedVehicles.contains(item)) {
        selectedVehicles.remove(item);
      } else {
        selectedVehicles.add(item);
      }
    });
  }

  Widget buildHighlightedText(String fullText, String searchQuery) {
    if (searchQuery.isEmpty) {
      return Text(
        fullText,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    final lowerText = fullText.toLowerCase();
    final lowerQuery = searchQuery.toLowerCase();
    final spans = <TextSpan>[];
    var startIndex = 0;

    while (startIndex < fullText.length) {
      final index = lowerText.indexOf(lowerQuery, startIndex);
      if (index == -1) {
        spans.add(TextSpan(text: fullText.substring(startIndex)));
        break;
      }
      if (index > startIndex) {
        spans.add(TextSpan(text: fullText.substring(startIndex, index)));
      }
      spans.add(TextSpan(
        text: fullText.substring(index, index + searchQuery.length),
        style: TextStyle(
          backgroundColor: Colors.yellow[200],
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ));
      startIndex = index + searchQuery.length;
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        children: spans,
      ),
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
              title: 'Subscription',
              centerTitle: true,
              onPressed: () => Navigator.pop(context),
            ),

            Expanded(
              child: SingleChildScrollView(
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

                    // Select Vehicle Dropdown Header
                    GestureDetector(
                      onTap: toggleDropdown,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F8F8),
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
                                  color: selectedVehicles.isNotEmpty
                                      ? Colors.black
                                      : Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Icon(
                              isDropdownExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Expanded Dropdown Content
                    if (isDropdownExpanded) ...[
                      const SizedBox(height: 12),

                      // Search Field
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFF1C63AB)),
                        ),
                        child: Column(
                          children: [
                            TextField(
                              controller: searchController,
                              onChanged: filterVehicles,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                hintText: 'Search vehicles...',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                prefixIcon: const Icon(Icons.search, size: 20),
                                suffixIcon: searchController.text.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(Icons.clear, size: 18),
                                        onPressed: () {
                                          searchController.clear();
                                          filterVehicles('');
                                        },
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Results count
                            Text(
                              '${selectedVehicles.length} selected (${filteredVehicles.length} shown)',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Vehicle List
                            Container(
                              constraints: const BoxConstraints(maxHeight: 300),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: filteredVehicles.length,
                                itemBuilder: (context, index) {
                                  final item = filteredVehicles[index];
                                  final isSelected = selectedVehicles.contains(item);

                                  return CheckboxListTile(
                                    dense: true,
                                    // Move checkbox to the right side
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    value: isSelected,
                                    title: buildHighlightedText(
                                      item.vehicleNumber,
                                      searchController.text,
                                    ),
                                    onChanged: (bool? newValue) {
                                      toggleSelection(item);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                      color: const Color.fromARGB(77, 21, 94, 149),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedVehicles.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select at least one vehicle'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CartPage(selectedVehicles: selectedVehicles.toList()),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1C63AB),
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
