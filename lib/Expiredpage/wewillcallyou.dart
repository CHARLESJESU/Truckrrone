import 'package:flutter/material.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';
import 'package:truckrrone/Expiredpage/widget/wewillcallyouwidget.dart';

class WeWillCallYouPage extends StatelessWidget {
  const WeWillCallYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Wewillcallyouwidget(
        imagePath: Imagepath.expiredwewillcall,
        title: 'We Will Call You Shortly',
        description: 'Our service team will Provide the promo code shortly. Thank you for your patience',
      ),
    );
  }
}
class RequestSendSuccessfully extends StatelessWidget {
  const RequestSendSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Wewillcallyouwidget(
        imagePath: Imagepath.expiredwewillcall,
        title: 'Request Send Already! ',
        description: 'Our service team will call you shortly. Thank you for your patience',
      ),
    );
  }
}
