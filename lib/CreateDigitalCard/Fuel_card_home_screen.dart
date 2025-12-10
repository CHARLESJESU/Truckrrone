import 'package:flutter/material.dart';
import 'package:truckrrone/CreateDigitalCard/widget/ccms_balance.dart';
import 'package:truckrrone/CreateDigitalCard/widget/dailogbox.dart';
import 'package:truckrrone/CreateDigitalCard/widget/digitalcarddetails.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';
import 'package:truckrrone/Route/approutes.dart';

class FuelHomeScreen extends StatefulWidget {
  const FuelHomeScreen({super.key});

  @override
  State<FuelHomeScreen> createState() => _FuelHomeScreenState();
}

class _FuelHomeScreenState extends State<FuelHomeScreen> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Imagepath.backbutton, width: 20),
        ),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Customer ID",
              style: TextStyle(fontSize: 11, fontFamily: "Poppins"),
            ),
            Row(
              children: [
                const Text(
                  "4002064832",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(Imagepath.coins, width: 20),
                const SizedBox(width: 4),
                const Text(
                  "5,000",
                  style: TextStyle(
                    color: Color(0xFF1D67B2),
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(onTap: (){
              Navigator.pushNamed(context, AppRoutes.settingspagecreatedigitalcard);
            },
                child: Image.asset(Imagepath.settings, width: 22)),
          )
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
        
              // ---------------- BUTTON ROW ----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, AppRoutes.ccmstocardtransfercreatedigitalcard);
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xFF1C63AB)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(Imagepath.ccmstocard, width: 24),
                              const SizedBox(width: 3),
                              const Text(
                                "Transfer CCMS to Card",
                                style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xFF1C63AB)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Imagepath.cardtoccms, width: 24),
                            const SizedBox(width: 3),
                            const Text(
                              "Transfer Card to CCMS",
                              style: TextStyle(
                                fontSize: 9,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 15),
        
              // ---------------- CCMS BALANCE CARD ----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CcmsBalance(
                  title: "CCMS Balance",
                  subtitle: "₹ 0.00",
                  onRecharge: () {},
                  ImagePath: Imagepath.wallet,
                  buttontext: "Recharge",
                ),
              ),
        
              const SizedBox(height: 20),
        
              // ---------------- FUEL CARD TITLE + NEW BUTTON ----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Fuel Card Details",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showCreateCardDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1C63AB),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        "+ New Card",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 12),
        
              // ---------------- SEARCH BAR ----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFE2E2E2)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey.shade600),
        
                      const SizedBox(width: 8),
        
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: "Search by Card no / Vehicle no",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Poppins",
                              fontSize: 12,
                            ),
        
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
        
              const SizedBox(height: 15),
        
              // ---------------- FUEL CARD TILE ----------------
              DigitalCardDetails(),
        
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}