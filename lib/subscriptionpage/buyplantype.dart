import 'package:flutter/material.dart';
import 'package:truckrrone/Route/approutes.dart';
import 'package:truckrrone/Colorcode/colorcode.dart';
import 'package:truckrrone/subscriptionpage/widget/bgimageforsubscription.dart';
import 'package:truckrrone/subscriptionpage/widget/bottombutton.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedPlan = 1; // 0 = Monthly, 1 = Yearly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Bgimageforsubscription(

              title: 'subscription',
              bgimagePath: Imagepath.subscriptionBackground, centerimagePath: Imagepath.subscriptioncrown,
            ),

            // --- CONTENT SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Text(
                    'Premium Plan',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPremiumTextColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '10 Days Left!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kBlueStart,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Your Premium Plan Will Expire on',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: AppColors.kLightTextColor,
                    ),
                  ),
                  const Text(
                    'August 22, 2025',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: AppColors.kLightTextColor,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Dashed Line
                  Row(
                    children: List.generate(
                      150 ~/ 5,
                      (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0
                              ? Colors.transparent
                              : Colors.grey.shade300,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Plans
                  _buildPlanCard(
                    title: 'Monthly',
                    price: '₹ 399',
                    subtitle: 'Pay monthly, cancel anytime',
                    value: 0,
                    isSelected: _selectedPlan == 0,
                    hasBestValue: false,
                  ),
                  const SizedBox(height: 16),
                  _buildPlanCard(
                    title: 'Yearly',
                    price: '₹ 4788',
                    subtitle: 'Pay for a full year',
                    value: 1,
                    isSelected: _selectedPlan == 1,
                    hasBestValue: true,
                  ),
                  const SizedBox(height: 40),

                  // Buy Button
                  Bottombutton(
                    label: 'Buy Plan',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.selectvehicle);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: AppColors.kHeaderIconColor, size: 20),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String subtitle,
    required int value,
    required bool isSelected,
    required bool hasBestValue,
  }) {
    final cardColor = isSelected ? AppColors.kBlueStart : Colors.white;
    final titleColor = isSelected ? Colors.white : AppColors.kPremiumTextColor;
    final priceColor = isSelected ? Colors.white : AppColors.kPremiumTextColor;
    final subtitleColor = isSelected
        ? Colors.white70
        : AppColors.kLightTextColor;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15.0),
          border: isSelected
              ? null
              : Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.kBlueStart.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                _buildSelectionIndicator(isSelected),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 10, color: subtitleColor),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: price,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: priceColor,
                        ),
                      ),
                      TextSpan(
                        text: '/vehicle',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: priceColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (hasBestValue)
              Positioned(
                top: -16,
                right: -16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF09B72D), Color(0xFFE69910)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Best Value',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionIndicator(bool isSelected) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.white : Colors.grey.shade400,
          width: 1.5,
        ),
      ),
      child: isSelected
          ? const Icon(Icons.check, size: 16, color: AppColors.kBlueStart)
          : null,
    );
  }
}
