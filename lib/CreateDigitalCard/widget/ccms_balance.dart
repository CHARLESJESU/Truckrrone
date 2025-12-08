import 'package:flutter/material.dart';
class CcmsBalance extends StatefulWidget {
final String title;
final String subtitle;
final String buttontext;
final VoidCallback onRecharge;
final String ImagePath;
  const CcmsBalance({super.key, required this.title, required this.subtitle, required this.onRecharge, required this.ImagePath, required this.buttontext});

  @override
  State<CcmsBalance> createState() => _CcmsBalanceState();
}

class _CcmsBalanceState extends State<CcmsBalance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFF9C48),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Wallet Icon
          Container(
            height: 50,width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(widget.ImagePath, width: 24, height: 24)
          ),
          const SizedBox(width: 12),
          // Balance Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Recharge Button
          ElevatedButton(
            onPressed: widget.onRecharge,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              widget.buttontext,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
