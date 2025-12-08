import 'package:flutter/material.dart';
import 'package:truckrrone/CreateDigitalCard/advancesetting.dart';
import 'package:truckrrone/CreateDigitalCard/ccmstocardtransfer.dart';
import 'package:truckrrone/CreateDigitalCard/generatempin.dart';
import 'package:truckrrone/CreateDigitalCard/selectvehiclescreen.dart';
import 'package:truckrrone/CreateDigitalCard/settingpage.dart';
import 'package:truckrrone/CreateDigitalCard/transaction_successful.dart';
import 'package:truckrrone/CreateDigitalCard/transactionhistory.dart';
import 'package:truckrrone/Expiredpage/freetrialexpired.dart';
import 'package:truckrrone/Expiredpage/wewillcallyou.dart';
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


  static Map<String, WidgetBuilder> routes = {
   intialsubscription: (context) => const SubscriptionScreen(),
    subscription: (context) => const SubscriptionScreen(),
    selectvehicle: (context) => const SelectVehiclePage(),
    checkout: (context) => const CheckoutPage(),
    expiredpage: (context) => const FreeTrialExpiredPage(),
    wewillcallyou: (context) => const WeWillCallYouPage(),
    TransactionsuccessfulScreenpagecreatedigitalcard: (context) => const TransactionSuccessful(),
    TransactionhistoryScreenpagecreatedigitalcard: (context) => const TransactionHistoryScreen(),
   requestsendsuccessfully: (
        context) => const RequestSendSuccessfully(),
   selectvehiclecreatedigitalcard: (
        context) => const Selectvehiclescreen(),
   ccmstocardtransfercreatedigitalcard: (
        context) => const CcmsToCardTransferScreen(),
   settingspagecreatedigitalcard: (
        context) => const SettingsScreen(),
   GenerateMpinScreenpagecreatedigitalcard: (
        context) => const GenerateMpinScreen(),
    AdvancedSettingsScreenpagecreatedigitalcard: (
        context) => const AdvancedSettingsScreen(),
  };
}
