import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenerateMpinScreen extends StatefulWidget {
  const GenerateMpinScreen({Key? key}) : super(key: key);

  @override
  State<GenerateMpinScreen> createState() => _GenerateMpinScreenState();
}

class _GenerateMpinScreenState extends State<GenerateMpinScreen> {
  final TextEditingController _mpinController = TextEditingController();

  @override
  void dispose() {
    _mpinController. dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Generate MPIN',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Description
              const Text(
                'Generate a 4-digit MPIN to unlock or reset the Fuel (Physical)Card PIN at the Fuel Station.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors. black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Note Section
              const Text(
                'Note :',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors. black87,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8),

              // Note Point 1
              Text(
                '1. If the MPIN is generated, it can\'t expire until the user uses this MPIN to unlock or reset the card PIN.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors. grey[600],
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8),

              // Note Point 2
              Text(
                '2. Once the MPIN is used, it will expire.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),

              // Set MPIN Label
              const Text(
                'Set MPIN',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // MPIN Input Field
              TextField(
                controller: _mpinController,
                keyboardType: TextInputType. number,
                maxLength: 4,
                obscureText: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                decoration: InputDecoration(
                  hintText: 'Enter New MPIN',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
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
                    borderRadius: BorderRadius. circular(8),
                    borderSide: const BorderSide(color: Color(0xFF1565C0)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  counterText: '', // Hide character counter
                ),
              ),
              const SizedBox(height: 32),

              // Generate MPIN Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_mpinController.text.length == 4) {
                      // Handle MPIN generation
                      print('MPIN: ${_mpinController.text}');
                      // Show success message or navigate
                    } else {
                      // Show error - MPIN must be 4 digits
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a 4-digit MPIN'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Generate MPIN',
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
      ),
    );
  }
}