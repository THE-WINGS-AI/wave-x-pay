import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kyc_controller.dart';

class KycView extends GetView<KycController> {
    final KycController kycController = Get.put(KycController());
   KycView({super.key});
  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFFF1A1A),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔴 Icon
         Container(
 child: Image.asset(
    'asserts/images/kyc error image.png', 
    width: 40,
    
    fit: BoxFit.cover,
  ),
),

            const SizedBox(height: 10),

            const Text(
              "Error",
              style: TextStyle(
                color: Color(0xFFFF1A1A),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Complete Your KYC to Continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            const Text(
              "To access payments and other features, please complete your KYC verification. It only takes a few minutes and ensures a secure experience.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.black54),
            ),

            const SizedBox(height: 6),

            const Text(
              "Know more → Set profile → Upgrade KYC",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),

            const SizedBox(height: 15),

         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20.0),
           child: Row(
             children: [
               Expanded(
                 child: OutlinedButton(
                   onPressed: kycController.onMaybeLater,
                   style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFFF1A1A), width: 1),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
                   ),
                   child: const Text(
            "Maybe Later",
            style: TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.w500,
            ),
                   ),
                 ),
               ),
           
               const SizedBox(width: 12),
           
               Expanded(
                 child: ElevatedButton(
                   onPressed: kycController.onCompleteKyc,
                   style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF1A1A),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // ❌ remove rounding
            ),
                   ),
                   child: const Text(
            "Complete KYC",
            style: TextStyle(
              color: Colors.white, // ✅ pure white
              fontWeight: FontWeight.w500,
            ),
                   ),
                 ),
               ),
             ],
           ),
         )],
        ),
      ),
    );
  }
}