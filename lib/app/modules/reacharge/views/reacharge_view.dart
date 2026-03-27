import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/reacharge_controller.dart';

class ReachargeView extends GetView<ReachargeController> {
  final ReachargeController reachargeController = Get.put(ReachargeController());
  ReachargeView({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2EB), // Page background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Recharge",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildMobileNumberInput(),
            const SizedBox(height: 25),
            _buildFirstRechargeOffer(),
            const SizedBox(height: 30),
            const Text(
              "Recent Recharges",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildRecentList(),
            const SizedBox(height: 30),
            OrangeButton(label: "Browse Recharge Plans",horizontalPadding: 5, onTap: () => reachargeController.browsePlans()),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileNumberInput() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Mobile Number", style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFF5D00).withOpacity(0.2)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: reachargeController.mobileNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter your mobile number",
                hintStyle:  TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Image.asset('asserts/images/recharge contect icon.png', width: 24),
                  onPressed: reachargeController.openContactPicker,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstRechargeOffer() {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('asserts/images/recharge background image.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Image.asset('asserts/images/recharge pop icon.png', width: 50), // Reusing pop icon as placeholder for party icon
          ),
           SizedBox(width: 15),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("First Recharge offer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Text("Get up to ₹50 cashback", style: TextStyle(color: Colors.white, fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRecentList() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 4,
    itemBuilder: (context, index) {
      // Define the list of LinearGradients based on your requirements
      final gradients = [
        const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00068B), Color(0xFF0F19F7)],
          stops: [0.0442, 0.8639],
        ),
        const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF5D00), Color(0xFFED884E)],
          stops: [0.115, 0.9421],
        ),
        const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFED1E79), Color(0xFF871145)],
          stops: [-0.0372, 0.9929], // Note: negative stops are handled by Flutter
        ),
        const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF710FEA), Color(0xFF2F0E58)],
          stops: [0.0, 1.0],
        ),
      ];

      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // Applied the gradient here instead of solid color
                gradient: gradients[index % gradients.length], 
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'asserts/images/call icon recharge.png', 
                width: 20, 
                color: Colors.white
              ),
            ),
            const SizedBox(width: 15),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mummy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text("91******9019", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Operator", style: TextStyle(color: Colors.grey, fontSize: 10)),
                Text("Airtel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              ],
            ),
            const SizedBox(width: 10),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      );
    },
  );
}

  // Widget _buildBrowseButton() {
  //   return GestureDetector(
  //     onTap: controller.browsePlans,
  //     child: Container(
  //       width: double.infinity,
  //       height: 60,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         gradient: const LinearGradient(
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //           colors: [Color(0xFFFF5D00), Color(0x85FF5D00)], // FF5D00 100% to 52%
  //         ),
  //         boxShadow: [
  //           BoxShadow(
  //             color: const Color(0xFF060C8D).withOpacity(0.15),
  //             offset: const Offset(0, 15),
  //             blurRadius: 30,
  //           ),
  //         ],
  //       ),
  //       child: const Center(
  //         child: Text(
  //           "Browse Recharge Plans",
  //           style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //     ),
  //   );
  // }

}