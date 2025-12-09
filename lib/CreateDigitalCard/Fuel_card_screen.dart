// lib/test/screens/Fuel_card_screen.dart

import 'package:flutter/material.dart';
import 'package:truckrrone/CreateDigitalCard/View_details.dart';
import 'package:truckrrone/CreateDigitalCard/widget/Elevated_button.dart';
import 'package:truckrrone/CreateDigitalCard/widget/Textfield.dart';
import 'package:truckrrone/CreateDigitalCard/widget/dropdown.dart';
import 'package:truckrrone/Route/approutes.dart';
import 'package:truckrrone/subscriptionpage/model/fuel_card_model.dart';

void showFuelCardBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const FuelCardRegistrationSheet(),
  );
}

class FuelCardRegistrationSheet extends StatefulWidget {
  const FuelCardRegistrationSheet({super.key});

  @override
  State<FuelCardRegistrationSheet> createState() => _FuelCardRegistrationSheetState();
}

class _FuelCardRegistrationSheetState extends State<FuelCardRegistrationSheet> {
  final _model = FuelCardModel();
  bool sameAsCurrent = false;

  final _nameCtrl = TextEditingController();
  final _mobileCtrl = TextEditingController();
  final _cardNameCtrl = TextEditingController();
  final _panCtrl = TextEditingController();

  final _curStreetCtrl = TextEditingController();
  final _curCityCtrl = TextEditingController();
  final _curZipCtrl = TextEditingController();

  final _permStreetCtrl = TextEditingController();
  final _permCityCtrl = TextEditingController();
  final _permZipCtrl = TextEditingController();

  String? selectedTitle;
  String? selectedCurState;
  String? selectedCurDistrict;
  String? selectedPermState;
  String? selectedPermDistrict;
  bool isPanvalid = false;

  @override
  void initState() {
    super.initState();
    _panCtrl.addListener(() {
      setState(() {
        isPanvalid = _panCtrl.text.trim().length == 10;
      });
    });
  }

  @override
  void dispose() {
    _panCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Create new HPCL Fuel card account",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "Poppins"),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: Colors.grey[300]),

          // Form Body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Track your fuel expenses with us",
                      style: TextStyle(color: Colors.grey[600], fontFamily: "Poppins")),

                  const SizedBox(height: 30),

                  _buildSectionTitle("Basic Info"),
                  const SizedBox(height: 10),

                  // Name + Title
                  Text("Name *", style: const TextStyle(fontFamily: "Poppins")),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: CustomAppDropdown<String>(
                          hint: "Mr",
                          value: selectedTitle,
                          items: ["Mr", "Mrs", "Ms", "Dr"]
                              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (v) => setState(() => selectedTitle = v),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(hint: "John", controller: _nameCtrl, isRequired: true),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Text("Mobile Number *", style: const TextStyle(fontFamily: "Poppins")),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hint: "+91 98764xxxxx",
                    controller: _mobileCtrl,
                    keyboardType: TextInputType.phone,
                    isRequired: true,
                  ),

                  const SizedBox(height: 20),
                  Text("Name on the Fuel Card *", style: const TextStyle(fontFamily: "Poppins")),
                  const SizedBox(height: 10),
                  CustomTextField(hint: "Enter name", controller: _cardNameCtrl, isRequired: true),

                  const SizedBox(height: 20),
                  Text("PAN Card *", style: const TextStyle(fontFamily: "Poppins")),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hint: "Ex: PHYU89HUII",
                    maxlenght: 10,
                    controller: _panCtrl,
                    isRequired: true,
                    suffix: GestureDetector(
                      onTap: isPanvalid ? () {} : null,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                        decoration: BoxDecoration(
                          color: isPanvalid ? const Color(0xFF1C63AB) : Colors.grey,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "Verify",
                          style: TextStyle(
                            color: Colors.white.withOpacity(isPanvalid ? 1.0 : 0.5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("Current Address"),

                  const SizedBox(height: 20),
                  _labeledRequired("Street"),
                  const SizedBox(height: 10),
                  CustomTextField(hint: "Enter street", controller: _curStreetCtrl, isRequired: true),

                  const SizedBox(height: 20),
                  _labeledRequired("City"),
                  const SizedBox(height: 10),
                  CustomTextField(hint: "Enter city", controller: _curCityCtrl, isRequired: true),

                  const SizedBox(height: 20),
                  _labeledRequired("State"),
                  const SizedBox(height: 10),
                  CustomSingleSelectDropdown(
                    hintText: "Select State",
                    selectedValue: selectedCurState,
                    items: const [
                      ["Tamil Nadu", "Tamil Nadu"],
                      ["Kerala", "Kerala"],
                      ["Karnataka", "Karnataka"],
                      ["Maharashtra", "Maharashtra"],
                      ["Delhi", "Delhi"],
                    ],
                    onChanged: (v) => setState(() => selectedCurState = v),
                  ),

                  const SizedBox(height: 20),
                  _labeledRequired("District"),
                  const SizedBox(height: 10),
                  CustomSingleSelectDropdown(
                    hintText: "Select District",
                    selectedValue: selectedCurDistrict,
                    items: const [
                      ["Chennai", "Chennai"],
                      ["Coimbatore", "Coimbatore"],
                      ["Madurai", "Madurai"],
                      ["Salem", "Salem"],
                    ],
                    onChanged: (v) => setState(() => selectedCurDistrict = v),
                  ),

                  const SizedBox(height: 20),
                  _labeledRequired("Zip Code"),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hint: "Zip Code",
                    controller: _curZipCtrl,
                    keyboardType: TextInputType.number,
                    isRequired: true,
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("Permanent Address"),

                  Row(
                    children: [
                      Checkbox(
                        value: sameAsCurrent,
                        onChanged: (v) {
                          setState(() => sameAsCurrent = v ?? false);
                          if (sameAsCurrent) {
                            _permStreetCtrl.text = _curStreetCtrl.text;
                            _permCityCtrl.text = _curCityCtrl.text;
                            _permZipCtrl.text = _curZipCtrl.text;
                            selectedPermState = selectedCurState;
                            selectedPermDistrict = selectedCurDistrict;
                            setState(() {});
                          }
                        },
                      ),
                      const Text("Same as Current address", style: TextStyle(fontFamily: "Poppins")),
                    ],
                  ),

                  const SizedBox(height: 20),
                  _labeledRequired("Street"),
                  const SizedBox(height: 10),
                  CustomTextField(hint: "Enter street", controller: _permStreetCtrl, isRequired: true),

                  const SizedBox(height: 20),
                  _labeledRequired("City"),
                  const SizedBox(height: 10),
                  CustomTextField(hint: "Enter city", controller: _permCityCtrl, isRequired: true),

                  const SizedBox(height: 20),
                  _labeledRequired("State"),
                  const SizedBox(height: 10),
                  CustomSingleSelectDropdown(
                    hintText: "Select State",
                    selectedValue: selectedPermState,
                    items: const [
                      ["Tamil Nadu", "Tamil Nadu"],
                      ["Kerala", "Kerala"],
                      ["Karnataka", "Karnataka"],
                      ["Maharashtra", "Maharashtra"],
                      ["Delhi", "Delhi"],
                    ],
                    onChanged: (v) => setState(() => selectedPermState = v),
                  ),

                  const SizedBox(height: 20),
                  _labeledRequired("District"),
                  const SizedBox(height: 10),
                  CustomSingleSelectDropdown(
                    hintText: "Select District",
                    selectedValue: selectedPermDistrict,
                    items: const [
                      ["Chennai", "Chennai"],
                      ["Coimbatore", "Coimbatore"],
                      ["Madurai", "Madurai"],
                      ["Salem", "Salem"],
                    ],
                    onChanged: (v) => setState(() => selectedPermDistrict = v),
                  ),

                  const SizedBox(height: 20),
                  _labeledRequired("Zip Code"),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hint: "Enter Zip Code",
                    controller: _permZipCtrl,
                    keyboardType: TextInputType.number,
                    isRequired: true,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Bottom Buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 6,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Cancel",
                    width: 10,
                    radius: 10,
                    height: 40,
                    fontfamily: "Poppins",
                    color: Colors.white,
                    textColor: Colors.black87,
                    fontSize: 15,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    text: "Submit",
                    width: 10,
                    radius: 10,
                    height: 40,
                    fontfamily: "Poppins",
                    color: const Color(0xFF1C63AB),
                    textColor: Colors.white,
                    fontSize: 15,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ViewdetailsScreen(cardName: _cardNameCtrl.text),
                      //   ),
                      // );
                      Navigator.pushNamed(context, AppRoutes.viewdetailscreatedigitalcard, arguments: {
                        'cardName': _cardNameCtrl.text,
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _labeledRequired(String label) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87, fontFamily: "Poppins"),
        children: [
          TextSpan(text: label),
          const TextSpan(text: " *", style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
      ),
    );
  }
}