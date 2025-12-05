import 'package:flutter/material.dart';

class Bgimageforsubscription extends StatelessWidget {
  final String bgimagePath;
  final String centerimagePath;
  final String title;
  const Bgimageforsubscription({super.key,  required this.bgimagePath, required this.centerimagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Blue Background Image
        Container(
          height: 320,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgimagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Content Overlay
        SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              // Calendar Image
              Image.asset(
                centerimagePath,
                width: 120,
                height: 120,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
