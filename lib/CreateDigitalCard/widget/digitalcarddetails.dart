import 'package:flutter/material.dart';
import 'package:truckrrone/Imagepath/imagepath.dart';
import 'dailogbox.dart';


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
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(cardType,style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 11,
                        color: Color(0xFF105499)

                    ),)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFE1FAEB),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                      color: Color(0xFF28A25B),
                      fontSize: 11,
                      fontFamily: "Poppins"),
                ),
              ),
              const SizedBox(width: 1),
              PopupMenuButton<VoidCallback>(
                icon: const Icon(Icons.more_vert),
                color: Colors.transparent,

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
                offset: const Offset(0, 0
                ),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    enabled: true,
                    padding: EdgeInsets.zero,
                    child: CardOptionsPopup(
                      onBlockCard: () {
                        showBlockCardDialog(context);
                      },
                      onChangeDriver: () {
                        showChangeDriverDialog(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(color: Colors.grey,),

          const SizedBox(height: 10),

          Column(
            children: [

              InfoRow(
                label: "Vehicle Number",
                value: "TN52/GH571",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),

              InfoRow(
                label: "Driver Name",
                value: "John Doe",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),

              InfoRow(
                label: "Reg Mobile Number",
                value: "+91 9876543210",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
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

Widget infoRow(String label, String value) {
  return Row(
    children: [
      Expanded(
        flex: 9,
        child: Text(label, style: labelStyle),
      ),
      Expanded(
        flex: 6,
        child: Text(value, style: valueStyle),
      ),
    ],
  );
}
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.labelStyle,
    required this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(label, style: labelStyle),
          Expanded(
            child: Text(
              value,
              style: valueStyle,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
