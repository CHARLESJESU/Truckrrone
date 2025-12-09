import 'package:flutter/material.dart';
import 'package:truckrrone/CreateDigitalCard/Fuel_card_home_screen.dart';
import 'package:truckrrone/CreateDigitalCard/View_details.dart';
import 'package:truckrrone/CreateDigitalCard/advancesetting.dart';
import 'package:truckrrone/CreateDigitalCard/ccmstocardtransfer.dart';
import 'package:truckrrone/CreateDigitalCard/generatempin.dart';
import 'package:truckrrone/CreateDigitalCard/selectvehiclescreen.dart';
import 'package:truckrrone/CreateDigitalCard/settingpage.dart';
import 'package:truckrrone/CreateDigitalCard/sign_up_screen.dart';
import 'package:truckrrone/CreateDigitalCard/transaction_successful.dart';
import 'package:truckrrone/CreateDigitalCard/transactionhistory.dart';
import 'package:truckrrone/Expiredpage/freetrialexpired.dart';
import 'package:truckrrone/Expiredpage/wewillcallyou.dart';
import 'package:truckrrone/homepage.dart';
import 'package:truckrrone/subscriptionpage/buyplantype.dart';
import 'package:truckrrone/subscriptionpage/checkout_page.dart';
import 'package:truckrrone/subscriptionpage/select_vehicle_page.dart';

class AppRoutes {
  static const String intialsubscription = '/';
  static const String subscription = '/subscription';
  static const String cartpage = '/cartpage';
  static const String selectvehicle = '/selectvehicle';
  static const String checkout = '/checkout';
  static const String expiredpage = '/expiredpage';
  static const String wewillcallyou = '/wewillcallyou';
  static const String requestsendsuccessfully = '/requestsendsuccessfully';
  static const String selectvehiclecreatedigitalcard = '/selectvehiclecreatedigitalcard';
  static const String ccmstocardtransfercreatedigitalcard = '/ccmstocardtransfercreatedigitalcard';
  static const String settingspagecreatedigitalcard = '/settingspagecreatedigitalcard';
  static const String GenerateMpinScreenpagecreatedigitalcard = '/GenerateMpinScreenpagecreatedigitalcard';
  static const String AdvancedSettingsScreenpagecreatedigitalcard = '/AdvancedSettingsScreenpagecreatedigitalcard';
  static const String TransactionhistoryScreenpagecreatedigitalcard = '/TransactionhistoryScreenpagecreatedigitalcard';
  static const String TransactionsuccessfulScreenpagecreatedigitalcard = '/TransactionsuccessfulScreenpagecreatedigitalcard';
  static const String signupcreatedigitalcard = '/signupcreatedigitalcard';
  static const String viewdetailscreatedigitalcard = '/viewdetailscreatedigitalcard';
  static const String fuelcardhomecreatedigitalcard = '/fuelcardhomecreatedigitalcard';
}

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.intialsubscription:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.subscription:
        return MaterialPageRoute(builder: (_) => const SubscriptionScreen());

      case AppRoutes.selectvehicle:
        return MaterialPageRoute(builder: (_) => const SelectVehiclePage());

      case AppRoutes.checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutPage());

      case AppRoutes.expiredpage:
        return MaterialPageRoute(builder: (_) => const FreeTrialExpiredPage());

      case AppRoutes.wewillcallyou:
        return MaterialPageRoute(builder: (_) => const WeWillCallYouPage());

      case AppRoutes.signupcreatedigitalcard:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case AppRoutes.viewdetailscreatedigitalcard:
        final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ViewdetailsScreen(cardName: args['cardName']),
          );


      case AppRoutes.fuelcardhomecreatedigitalcard:
        return MaterialPageRoute(builder: (_) => const FuelHomeScreen());

      case AppRoutes.TransactionsuccessfulScreenpagecreatedigitalcard:
        return MaterialPageRoute(builder: (_) => const TransactionSuccessful());

      case AppRoutes.TransactionhistoryScreenpagecreatedigitalcard:
        return MaterialPageRoute(builder: (_) => const TransactionHistoryScreen());

      case AppRoutes.requestsendsuccessfully:
        return MaterialPageRoute(builder: (_) => const RequestSendSuccessfully());

      case AppRoutes.selectvehiclecreatedigitalcard:
        return MaterialPageRoute(builder: (_) => const Selectvehiclescreen());

      case AppRoutes.ccmstocardtransfercreatedigitalcard:
        return MaterialPageRoute(builder: (_) => const CcmsToCardTransferScreen());

      case AppRoutes.settingspagecreatedigitalcard:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      case AppRoutes.GenerateMpinScreenpagecreatedigitalcard:
        return MaterialPageRoute(builder: (_) => const GenerateMpinScreen());

      case AppRoutes.AdvancedSettingsScreenpagecreatedigitalcard:
        return MaterialPageRoute(builder: (_) => const AdvancedSettingsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}