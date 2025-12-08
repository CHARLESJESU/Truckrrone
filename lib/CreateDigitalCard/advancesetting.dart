import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truckrrone/CreateDigitalCard/widget/appbar.dart';

class AdvancedSettingsScreen extends StatefulWidget {
  const AdvancedSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AdvancedSettingsScreen> createState() => _AdvancedSettingsScreenState();
}

class _AdvancedSettingsScreenState extends State<AdvancedSettingsScreen> {
  bool setCcmsAlert = false;
  bool setAutoTransfer = false;

  final TextEditingController _ccmsMinAmountController = TextEditingController();
  final TextEditingController _autoTransferMinAmountController = TextEditingController();
  final TextEditingController _autoTransferUptoController = TextEditingController();

  @override
  void dispose() {
    _ccmsMinAmountController.dispose();
    _autoTransferMinAmountController.dispose();
    _autoTransferUptoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Appbar(title: 'Advanced Settings', onPressed: () => Navigator.pop(context)),
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          // Rule Settings Header
                          const Text(
                          'Rule Settings',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Set CCMS Alert Toggle
                        _buildSettingToggle(
                          title: 'Set CCMS Alert',
                          value: setCcmsAlert,
                          onChanged: (value) {
                            setState(() {
                              setCcmsAlert = value;
                            });
                          },
                        ),

                        // CCMS Alert Expanded Section
                        if (setCcmsAlert) ...[
                    const SizedBox(height: 16),
                _buildRequiredLabel('Set Minimum Amount'),
                const SizedBox(height: 8),
                _buildTextField(
                  controller: _ccmsMinAmountController,
                  hintText: '₹ 0',
                ),
                const SizedBox(height: 16),
                _buildHowToUse([
                  '1. Enter the amount in the input box - eg: ₹ 10,000.',
                  '2. If the CCMS balance become less than 10,000 (eg: ₹ 8,999), you will get Alert.',
                ]),
                ],

                const SizedBox(height: 16),

            // Set Auto-Transfer CCMS to Card Toggle
            _buildSettingToggle(
              title: 'Set Auto-Transfer CCMS to Card',
              value: setAutoTransfer,
              onChanged: (value) {
                setState(() {
                  setAutoTransfer = value;
                });
              },
            ),

            // Auto-Transfer Expanded Section
            if (setAutoTransfer) ...[
              const SizedBox(height: 16),
              const Text(
                'Set Minimum Amount',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors. black87,
                ),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _autoTransferMinAmountController,
                hintText: '₹ 0',
              ),
              const SizedBox(height: 16),
              const Text(
                'Auto Transfer Upto',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight. w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _autoTransferUptoController,
                hintText: '₹ 0',
              ),
              const SizedBox(height: 16),
              _buildHowToUse([
                '1. Enter the minimum amount - eg: 500',
                '2. Enter Auto transfer amount - eg: 1500',
                '3. If the Card balance goes below 500 (eg: 499), ₹1,500 will automatically transferred to the card',
              ]),
            ],
          ],
        ),
      ),
    ),
    ),

    // Bottom Buttons
    Padding(
    padding: const EdgeInsets. all(16.0),
    child: Row(
    children: [
    Expanded(
    child: OutlinedButton(
    onPressed: () {
    Navigator.pop(context);
    },
    style: OutlinedButton.styleFrom(
    foregroundColor: Colors.grey[700],
    side: BorderSide(color: Colors. grey[300]!),
    padding: const EdgeInsets. symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    ),
    child: const Text(
    'Cancel',
    style: TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight. w600,
    ),
    ),
    ),
    ),
    const SizedBox(width: 16),
    Expanded(
    child: ElevatedButton(
    onPressed: () {
    // Handle update settings
    print('CCMS Alert: $setCcmsAlert');
    print('CCMS Min Amount: ${_ccmsMinAmountController. text}');
    print('Auto Transfer: $setAutoTransfer');
    print('Auto Transfer Min: ${_autoTransferMinAmountController.text}');
    print('Auto Transfer Upto: ${_autoTransferUptoController. text}');

    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text('Settings updated successfully'),
    ),
    );
    },
    style: ElevatedButton. styleFrom(
    backgroundColor: const Color(0xFF1565C0),
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 16),
    elevation: 0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    ),
    child: const Text(
    'Update',
    style: TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
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

  Widget _buildSettingToggle({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment. spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF1565C0),
          activeTrackColor: const Color(0xFF1565C0). withOpacity(0.5),
          inactiveThumbColor: Colors.grey[400],
          inactiveTrackColor: Colors.grey[300],
        ),
      ],
    );
  }

  Widget _buildRequiredLabel(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight. w500,
          color: Colors.black87,
        ),
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
          fontFamily: 'Poppins',
        ),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius. circular(8),
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
    );
  }

  Widget _buildHowToUse(List<String> instructions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How To use? ',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        ...instructions.map((instruction) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            instruction,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              color: Colors.grey[600],
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        )). toList(),
      ],
    );
  }
}