import 'package:flutter/material.dart';
import '../Imagepath/imagepath.dart';

class TransactionSuccessful extends StatelessWidget {
  const TransactionSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    // Auto-close after 1 second
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pop(context);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          Imagepath.transaction_successful,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

