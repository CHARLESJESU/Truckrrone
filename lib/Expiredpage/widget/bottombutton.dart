import 'package:flutter/material.dart';
import 'package:truckrrone/Colorcode/colorcode.dart';
import 'package:truckrrone/Route/approutes.dart';

class Bottombutton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const Bottombutton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
       
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kBlueStart,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color:AppColors.kHeaderIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
