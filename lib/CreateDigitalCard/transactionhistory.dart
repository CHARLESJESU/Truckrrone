import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truckrrone/CreateDigitalCard/widget/appbar.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;

  @override
  void initState() {
    super.initState();
    // Set default dates
    fromDate = DateTime. now().subtract(const Duration(days: 30));
    toDate = DateTime.now();
    _fromDateController.text = DateFormat('dd/MM/yyyy').format(fromDate!);
    _toDateController.text = DateFormat('dd/MM/yyyy').format(toDate!);
  }

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate ? fromDate!  : toDate!,
      firstDate: DateTime(2020),
      lastDate: DateTime. now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1565C0),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
          _fromDateController.text = DateFormat('dd/MM/yyyy'). format(picked);
        } else {
          toDate = picked;
          _toDateController.text = DateFormat('dd/MM/yyyy').format(picked);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Range Header
              Appbar(title: 'Transaction History', onPressed: () => Navigator.pop(context)),

              Padding(
                padding: EdgeInsets.all(20),                child: const Text(
                  'Select Date range between 30 days',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    // From Date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From Date',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildDateField(
                            controller: _fromDateController,
                            onTap: () => _selectDate(context, true),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                
                    // To Date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To Date',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildDateField(
                            controller: _toDateController,
                            onTap: () => _selectDate(context, false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // View History Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle view history
                    print('From: ${_fromDateController.text}');
                    print('To: ${_toDateController.text}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'View History',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // No Transaction Image
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      Imagepath.notransaction,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }

  Widget _buildDateField({
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              Imagepath.calender,
              width: 20,
              height: 20,
              color: const Color(0xFF1565C0),
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]! ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF1565C0)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }
}