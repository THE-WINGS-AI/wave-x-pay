import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_details_controller.dart';

class PaymentDetailsView extends GetView<PaymentDetailsController> {
  final PaymentDetailsController paymentDetailsController = Get.put(PaymentDetailsController());
   PaymentDetailsView({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          // Background linear-gradient
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [-0.14, 0.88],
            colors: [Color(0xFFFF5D00), Color(0xFFFFFFFF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              const SizedBox(height: 20),
              _buildReceiptCard(),
              const SizedBox(height: 40),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          Expanded(
            child: Text(
              "Payment Details",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildReceiptCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Success Icon
          Row(
            children: [
              Image.asset('asserts/images/success icon got recipt page.png', width: 40),
              const SizedBox(width: 15),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment successful", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("22 Feb 2022, 11:17 am", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              )
            ],
          ),
          const Divider(height: 40),
          
          // Paid to Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Paid to", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text("ABDUL ALEEM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text("98_____210", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text("Description : Food Bill", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              TextButton(
                onPressed: paymentDetailsController.payAgain,
                child: const Text("Pay again", style: TextStyle(color: Color(0xFF060C8D), fontWeight: FontWeight.bold)),
              )
            ],
          ),
          const SizedBox(height: 20),

          // Paid from Section
          const Text("Paid from", style: TextStyle(color: Colors.grey, fontSize: 12)),
          const Text("Savings Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const Text("Account no. : xxxx1789", style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 20),

          // Transaction ID
          const Text("Transaction ID", style: TextStyle(color: Colors.grey, fontSize: 12)),
          const Text("205311447165", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const Divider(height: 40),

          // Total Amount
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Amount", style: TextStyle(color: Colors.grey, fontSize: 16)),
              Text("₹ 100", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ],
          ),
        ],
      ),      
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          // Home Button (White background)
          Expanded(
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: paymentDetailsController.goHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F4FA),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("Home", style: TextStyle(color: Color(0xFFFF5D00), fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Share Receipt Button (Orange Gradient)
          Expanded(
            child: GestureDetector(
              onTap: paymentDetailsController.shareReceipt,
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient:  LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFFFF5D00), Color(0x85FF5D00)],
                  ),
                ),
                child: const Center(
                  child: Text("Share receipt", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}