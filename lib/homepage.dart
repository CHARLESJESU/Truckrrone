import 'package:flutter/material.dart';
import 'package:truckrrone/Route/approutes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context,AppRoutes.subscription),
              child: const Text('subscribtion'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.signupcreatedigitalcard),
              child: const Text('creatdigitalcard'),
            ),
          ],
        ),
      ),
    );
  }
}

