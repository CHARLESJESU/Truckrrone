import 'package:flutter/material.dart';
import 'package:truckrrone/CreateDigitalCard/widget/ccms_balance.dart';
import 'package:truckrrone/CreateDigitalCard/widget/digitalcarddetails.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';
import 'package:truckrrone/Route/approutes.dart';

class CcmsToCardTransferScreen extends StatefulWidget {
  const CcmsToCardTransferScreen({Key? key}) : super(key: key);

  @override
  State<CcmsToCardTransferScreen> createState() =>
      _CcmsToCardTransferScreenState();
}

class _CcmsToCardTransferScreenState extends State<CcmsToCardTransferScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _amountController = TextEditingController(text: '₹ 1,000');
  bool applySameAmount = true;

  @override
  void dispose() {
    _searchController.dispose();
    _amountController.dispose();
    super. dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Header with Customer ID and Settings
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  const SizedBox(width: 16),
                  // Customer ID
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer ID',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors. grey[600],
                          ),
                        ),
                        const Text(
                          '400206832',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Settings Icon
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.settingspagecreatedigitalcard);
                      // Handle settings
                    },
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Colors.grey[700],
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      const Text(
                        'CCMS to Card Transfer',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // CCMS Balance Card
                      CcmsBalance(
                        title: 'CCMS Balance',
                        subtitle: '₹ 0.00',
                        buttontext: 'Recharge',
                        onRecharge: () {
                          // Handle recharge
                        },
                        ImagePath: Imagepath.wallet,
                      ),
                      const SizedBox(height: 24),

                      // Fuel Card Details
                      const Text(
                        'Fuel Card Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors. black,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Search Box
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search by Card no/Vehicle no',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[400],
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Transfer Amount
                      const Text(
                        'Transfer Amount',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Amount Input with Checkbox
                      Row(
                        children: [
                          // Amount Input
                          Expanded(
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors. grey[300]!),
                              ),
                              child: TextField(
                                controller: _amountController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets. zero,
                                ),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Apply Same Amount Checkbox
                          Row(
                            children: [
                              Checkbox(
                                value: applySameAmount,
                                onChanged: (value) {
                                  setState(() {
                                    applySameAmount = value ??  false;
                                  });
                                },
                                activeColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Text(
                                'Apply same Amount',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Card Details
                   DigitalCardDetails(),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Handle cancel
                      },
                      style: OutlinedButton. styleFrom(
                        foregroundColor: Colors.grey[700],
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
                          fontWeight: FontWeight. w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.TransactionsuccessfulScreenpagecreatedigitalcard);
                        // Handle transfer
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
                        'Transfer',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment. spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

const labelStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 11,
  color: Colors.black54,
);

const valueStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 13,
  fontWeight: FontWeight.w500,
);