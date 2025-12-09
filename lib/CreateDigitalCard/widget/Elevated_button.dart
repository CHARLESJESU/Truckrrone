import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String fontfamily;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double radius;
  final double height;
  final double width;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.text,
    this.fontfamily = "Poppins",
    required this.onPressed,
    this.color = const Color(0xFF1C63AB),
    this.textColor = Colors.white,
    this.radius = 10,
    this.height = 50,
    this.width = double.infinity,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontFamily: fontfamily,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}