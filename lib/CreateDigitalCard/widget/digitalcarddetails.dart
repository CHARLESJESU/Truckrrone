import 'package:flutter/material.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';

class DigitalCardDetails extends StatelessWidget {
  const DigitalCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  ccmsBalanceWidget(
        cardNumber: "1234 5678 9012 3456",
        cardType: "CCMS Card",
        status: "Active",
        vehicleNumber: "TN52/GH571",
        driverName: "John Doe",
        mobileNumber: "+91 9876543210",
        cardImagePath: Imagepath.creditcard,
      );
  }
}

Widget ccmsBalanceWidget(
    {
      required String cardNumber,
      required String cardType,
      required String status,
      required String vehicleNumber,
      required String driverName,
      required String mobileNumber,
      required String cardImagePath,
    })
{
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFFE2E2E2)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(cardImagePath, width: 35),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardNumber,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(cardType,style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xFF105499)

                    ),)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFD5F3D6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 11,
                      fontFamily: "Poppins"),
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.more_vert),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Text("Vehicle Number", style: labelStyle),
              SizedBox(width:90 ),
              Text(vehicleNumber, style: valueStyle),
            ],
          ),


          const SizedBox(height: 10),

          Row(
            children: [
              Text("Driver Name", style: labelStyle),
              SizedBox(width:90 ),
              Text(driverName, style: valueStyle),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Text("Reg Mobile Number", style: labelStyle),
              SizedBox(width:40 ),
              Text(mobileNumber, style: valueStyle),
            ],
          ),


          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: Color(0xFFEFF5FF),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              "Check balance",
              style: TextStyle(
                color: Color(0xFF105499),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

const labelStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 11,
  color: Colors.black54,
);

const valueStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 13,
  fontWeight: FontWeight.w500,
);