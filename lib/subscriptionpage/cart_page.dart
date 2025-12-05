import 'package:flutter/material.dart';
import 'package:truckrrone/Route/approutes.dart';
import 'package:truckrrone/subscriptionpage/model/vehicleitem.dart';

import 'package:truckrrone/subscriptionpage/widget/appbar.dart';

import 'package:truckrrone/subscriptionpage/widget/bottombutton.dart';
import 'package:truckrrone/subscriptionpage/widget/cartcontainer.dart';
import 'package:truckrrone/subscriptionpage/widget/cartsummary.dart';

class CartPage extends StatelessWidget {
  final List<VehicleItem> selectedVehicles;

  const CartPage({super.key, required this.selectedVehicles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Appbar(
              label: 'Cart',
              onPressed: () => Navigator.pop(context),
            ),

            // Content area with fixed sections
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Plan Purchase',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Super Container with scrollable cart items
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.08),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ListView.separated(
                          itemCount: selectedVehicles.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final vehicle = selectedVehicles[index];
                            return CartItemCard(
                              vehicleNo: vehicle.vehicleNumber,
                              price: vehicle.price,
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Dashed Line
                    Row(
                      children: List.generate(
                        150 ~/ 2,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : Colors.blue[100],
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Summary with dynamic calculations
                    Cartsummary(label: 'Subtotal',value:  _calculateSubtotal(), isBold: false),
                    const SizedBox(height: 12),
                    Cartsummary(label:'CGST( 9% )',value:  _calculateCGST(), isBold: false),
                    const SizedBox(height: 12),
                    Cartsummary(label:'SGST( 9% )',value:  _calculateSGST(), isBold: false),
                    const SizedBox(height: 12),
                    Cartsummary(label:'Total',value:  _calculateTotal(), isBold: true),
                  ],
                ),
              ),
            ),

            // Checkout Button
            Bottombutton(
              label: 'checkout',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.checkout);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }


  double _getSubtotalAmount() {
    double total = 0;
    for (var vehicle in selectedVehicles) {
      // Remove ₹ symbol and convert to double
      String priceStr = vehicle.price
          .replaceAll('₹', '')
          .replaceAll(',', '')
          .trim();
      total += double.tryParse(priceStr) ?? 0;
    }
    return total;
  }

  String _calculateSubtotal() {
    double subtotal = _getSubtotalAmount();
    return '₹ ${subtotal.toStringAsFixed(2)}';
  }

  String _calculateCGST() {
    double subtotal = _getSubtotalAmount();
    double cgst = subtotal * 0.09;
    return '₹ ${cgst.toStringAsFixed(2)}';
  }

  String _calculateSGST() {
    double subtotal = _getSubtotalAmount();
    double sgst = subtotal * 0.09;
    return '₹ ${sgst.toStringAsFixed(2)}';
  }

  String _calculateTotal() {
    double subtotal = _getSubtotalAmount();
    double total = subtotal + (subtotal * 0.09) + (subtotal * 0.09);
    return '₹ ${total.toStringAsFixed(2)}';
  }
}


