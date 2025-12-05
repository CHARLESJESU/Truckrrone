import 'package:flutter/material.dart';
import 'package:truckrrone/Colorcode/colorcode.dart';

class Wewillcallyouwidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const Wewillcallyouwidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Illustration Image
              Image.asset(
                imagePath,
                width: 250,
                height: 180,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 32),
              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kBlueStart,
                ),
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9E9E9E),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
