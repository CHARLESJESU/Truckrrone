import 'package:flutter/material.dart';
import 'package:truckrrone/CreateDigitalCard/Fuel_card_home_screen.dart';
import 'package:truckrrone/CreateDigitalCard/widget/appbar.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';
import 'package:truckrrone/Route/approutes.dart';

import 'Fuel_card_screen.dart';

class ViewdetailsScreen extends StatelessWidget {
  final String cardName;
  const ViewdetailsScreen({super.key,required this.cardName
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:Appbar(title: "Diesel", onPressed: (){}),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.fuelcardhomecreatedigitalcard);
                    },
                    child: Container(
                      height: 260,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFF36B3D)),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 225,
                            left: 20,
                            child: Text(
                              "View Details",
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                          ),
                          Positioned(
                            left: 266,
                            top: 223,
                            child: Image.asset(Imagepath.backbutton,width: 30,),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                          Positioned(
                            top: 54,
                            left: 25,
                            child: Text(
                              "Track your fuel expense with us.",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Positioned(
                            width: 135,
                            left: 179,
                            top: 40,
                            child: Image.asset(
                              Imagepath.oil,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: 140,
                            left: 20,
                            child: Text(
                              "4440 9079 6788",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 180,
                            left: 20,
                            child: Text(
                              cardName,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                color: Colors.white,
                              ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}