import 'package:flutter/material.dart';
import 'package:truckrrone/Route/approutes.dart';
import 'package:truckrrone/subscriptionpage/buyplantype.dart';
import 'package:truckrrone/subscriptionpage/checkout_page.dart';
import 'package:truckrrone/subscriptionpage/select_vehicle_page.dart';
import 'package:truckrrone/Expiredpage/freetrialexpired.dart';
import 'package:truckrrone/Expiredpage/wewillcallyou.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.intialsubscription,
      routes: {
        AppRoutes.intialsubscription: (context) => const SubscriptionScreen(),
        AppRoutes.subscription: (context) => const SubscriptionScreen(),
        AppRoutes.selectvehicle: (context) => const SelectVehiclePage(),
        AppRoutes.checkout: (context) => const CheckoutPage(),
        AppRoutes.expiredpage: (context) => const FreeTrialExpiredPage(),
        AppRoutes.wewillcallyou: (context) => const WeWillCallYouPage(),
        AppRoutes.requestsendsuccessfully: (context) => const RequestSendSuccessfully(),
      },
    );
  }
}
