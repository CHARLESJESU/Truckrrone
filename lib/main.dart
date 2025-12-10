import 'package:flutter/material.dart';
import 'package:truckrrone/CreateDigitalCard/advancesetting.dart';
import 'package:truckrrone/CreateDigitalCard/ccmstocardtransfer.dart';
import 'package:truckrrone/CreateDigitalCard/generatempin.dart';
import 'package:truckrrone/CreateDigitalCard/selectvehiclescreen.dart';
import 'package:truckrrone/CreateDigitalCard/settingpage.dart';
import 'package:truckrrone/Route/approutes.dart';
import 'package:truckrrone/subscriptionpage/buyplantype.dart';
import 'package:truckrrone/subscriptionpage/checkout_page.dart';
import 'package:truckrrone/subscriptionpage/select_vehicle_page.dart';
import 'package:truckrrone/Expiredpage/freetrialexpired.dart';
import 'package:truckrrone/Expiredpage/wewillcallyou.dart';

import 'Route/approutes.dart';

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
      onGenerateRoute: AppRouteGenerator.generateRoute,
    );
  }
}
