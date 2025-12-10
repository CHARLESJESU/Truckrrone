import 'package:flutter/material.dart';
import 'package:truckrrone/CreateDigitalCard/Fuel_card_screen.dart';
import 'package:truckrrone/CreateDigitalCard/widget/Elevated_button.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor:Colors.white,title: Text("Diesel",style: TextStyle(fontFamily: "Poppins"),), ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          Imagepath.background,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 65,
                        child: Image.asset(
                          Imagepath.hpcl,
                          width: 40,
                          height: 15,
                          fit: BoxFit.contain,
                        ),
                      ),
            
                      Positioned.fill(
                        child: Image.asset(
                          Imagepath.foreground,
                          fit: BoxFit.cover,
                        ),
                      ),
            
                      Positioned(
                        top: 20,
                        left: 9,
                        child: Image.asset(
                          Imagepath.hplogo,
                          width: 60,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Track your fuel expenses with us.",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1C63AB)
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              Text(
                "Create new account",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "A few steps away from getting started",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Poppins",
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height:30),
              CustomButton(
                text: "SignUp",
                onPressed: () {
                  showFuelCardBottomSheet(context);
                },
                color: const Color(0xFF1C63AB),
                radius: 5,
                height: 56,
                fontSize: 18,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}