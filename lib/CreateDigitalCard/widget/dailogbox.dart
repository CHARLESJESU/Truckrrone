import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Route/approutes.dart';
import 'dropdown.dart';
//New card//
void showCreateCardDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Create new card",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              const Text(
                "Select the type of card",
                style: TextStyle(fontSize: 14, color: Colors.grey,fontFamily: "Poppins"),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  physicalCardButton(),
                  const SizedBox(width: 12),
                  digitalCardButton(context),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
void showChangeDriverDialog(BuildContext context, ) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Driver for \n U12344444",
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700,fontFamily: "Poppins"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              const Text("Select Driver",style: TextStyle(fontFamily: "Poppins"),),
              const SizedBox(height: 8),

              CustomSingleSelectDropdown(
                enableSearch: false,
                hintText: 'Ram', items: [["Ram"], ["Ravi"], ["Shyam"]], onChanged: (value) {  },
                // child: DropdownButton<String>(
                //   hint: const Text("Eg. Ram",style: TextStyle(fontFamily: "Poppins"),),
                //   items: ["Ram", "Ravi", "Shyam"]
                //       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                //       .toList(),
                //   onChanged: (value) {},
                // ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Note :",
                style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Poppins"),
              ),
              const SizedBox(height: 5),

              const Text(
                "1. Changing the driver here, it will unlink the existing driver and link the new driver\n"
                    "2. Removing the driver here, it will also unlink the driver.\n"
                    "3. If you make any changes here, it will be reflected in the Driver and Vehicle Module.",
                style: TextStyle(fontSize: 12, color: Colors.grey,fontFamily: "Poppins"),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _dialogButton("Cancel", Colors.grey.shade300, Colors.black, () {
                    Navigator.pop(context);
                  }),
                  _dialogButton("Confirm", const Color(0xFF1D67B2), Colors.white, () {
                    Navigator.pop(context);
                  }),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _dialogButton(
    String text, Color bgColor, Color textColor, VoidCallback onTap) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onTap,
        child: Text(text,style: TextStyle(fontFamily: "Poppins"),),
      ),
    ),
  );
}

void showBlockCardDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Colors.red, size: 28),

                  const Text(
                    "Are you Sure?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              const SizedBox(height:4),
              const SizedBox(height: 10),

              Text(
                "Would you like to block the card associated with ?",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black87,
                fontFamily: "Poppins"),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _dialogButton("No, Cancel", Colors.grey.shade300, Colors.black,
                          () => Navigator.pop(context)),
                  _dialogButton("Yes, Confirm", Color(0xFF1C63AB), Colors.white,
                          () => Navigator.pop(context)),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
Widget physicalCardButton() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xFF1C63AB),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          "Physical Card",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Coming Soon Badge
      Positioned(
        top: -5,
        left: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                Color(0xFFF4872A),
                Color(0xFFA243EB),
                Color(0xFFE943EB),
              ],
            ),
          ),
          child: const Text(
            "Coming Soon",
            style: TextStyle(
              color: Colors.white,
              fontSize: 6,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ],
  );
}
Widget digitalCardButton(BuildContext context) {
  return InkWell(
    onTap: (){
       Navigator.pushNamed(context,AppRoutes.selectvehiclecreatedigitalcard);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFF1C63AB),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Text(
        "Digital Card",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}


class CardOptionsPopup extends StatelessWidget {
  final VoidCallback onBlockCard;
  final VoidCallback onChangeDriver;

  const CardOptionsPopup({
    super.key,
    required this.onBlockCard,
    required this.onChangeDriver,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 95,
        width: 140,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _optionTile(
              icon: Icons.block,
              title: "Block Card",
              onTap: onBlockCard,
            ),
            const Divider(height: 1),
            _optionTile(
              icon: Icons.person,
              title: "Change Driver",
              onTap: onChangeDriver,
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionTile(
      {required IconData icon,
        required String title,
        required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.black87),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



