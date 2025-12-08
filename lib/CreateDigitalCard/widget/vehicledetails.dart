import 'package:flutter/material.dart';
class Vehicledetails extends StatelessWidget {
  const Vehicledetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          _buildDetailRow('Vehicle Number', 'TN23B10306'),
          const Divider(height: 24),
          _buildDetailRow('Driver Name', 'RAJAPANDI P'),
          const Divider(height: 24),
          _buildDetailRow('Vehicle Registration Year', '2022'),
          const Divider(height: 24),
          _buildDetailRow('Manufactured Company', 'TATA MOTORS LTD'),
          const Divider(height: 24),
          _buildDetailRow('Phone number', '+916369259822'),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'RC Documents',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              TextButton. icon(
                onPressed: () {
                  // Handle upload RC document
                },
                icon: const Icon(
                  Icons.cloud_upload_outlined,
                  size: 18,
                ),
                label: const Text('Upload RC Document'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF1565C0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors. grey[600],
            fontSize: 14,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
