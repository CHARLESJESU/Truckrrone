import 'package:flutter/material.dart';
import 'package:truckrrone/CreateDigitalCard/widget/appbar.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Custom Appbar
            Appbar(
              title: 'Settings',
              onPressed: () => Navigator.pop(context),
              centerTitle: false,
              textColor: Colors.black,
              appBarBackgroundColor: Colors.white,
            ),
            const SizedBox(height: 8),

            // Generate MPIN
            _buildSettingsItem(
              context,
              image: Imagepath.generatempin,
              iconColor: const Color(0xFF1565C0),
              title: 'Generate MPIN',
              onTap: () {
                // Navigate to Generate MPIN screen
              },
            ),
            const Divider(height: 1, indent: 60),

            // Transaction History
            _buildSettingsItem(
              context,
              image: Imagepath.transactionhistory,
              iconColor: const Color(0xFF1565C0),
              title: 'Transaction History',
              onTap: () {
                // Navigate to Transaction History screen
              },
            ),
            const Divider(height: 1, indent: 60),

            // Advanced Settings
            _buildSettingsItem(
              context,
              image: Imagepath.advancesetting,
              iconColor: const Color(0xFF1565C0),
              title: 'Advanced Settings',
              onTap: () {
                // Navigate to Advanced Settings screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context, {
        required String image,
        required Color iconColor,
        required String title,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: Colors.white,
        child: Row(
          children: [
            // Icon Container
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor. withOpacity(0.1),
                borderRadius: BorderRadius. circular(8),
              ),
              child: Image.asset(image)
            ),
            const SizedBox(width: 16),
            // Title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            // Arrow Icon
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}