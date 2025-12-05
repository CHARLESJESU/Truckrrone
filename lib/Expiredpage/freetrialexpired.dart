import 'package:flutter/material.dart';
import 'package:truckrrone/Expiredpage/widget/bgimageforexpired.dart';
import 'package:truckrrone/Expiredpage/widget/bottombutton.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';
import 'package:truckrrone/Colorcode/colorcode.dart';
import 'package:truckrrone/Route/approutes.dart';

class FreeTrialExpiredPage extends StatelessWidget {
  const FreeTrialExpiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Blue Background Section with Calendar
        Bgimageforexpired(

        title: 'Free Trial Expired',
      bgimagePath: Imagepath.expiredBackground, centerimagePath: Imagepath.expiredCalender,
      ),


          // Bottom White Section with Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Main Heading
                  const Text(
                    'Your Free Trial Has Expired',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Description Text
                  const Text(
                    'To Continue Using Our Application Without Interruption, Please Subscribe. If You Would Like To Extend Your Free Trial For Another 14 Days, Enter The Promo Code To Continue.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9E9E9E),
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  // Contact Us Button
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.kBlueStart,
                        width: 1.5,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.requestsendsuccessfully);
                          // Navigator.pushNamed(context, AppRoutes.wewillcallyou);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: const Center(
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kBlueStart,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Subscribe Now Button
                  Bottombutton(
                    label: 'Subscribe Now',
                    onPressed: () {
                      // Handle Subscribe Now action
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
