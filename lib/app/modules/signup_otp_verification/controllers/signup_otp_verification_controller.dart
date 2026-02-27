import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtpay/app/widgets/status_dialog.dart';

class SignupOtpVerificationController extends GetxController {
final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());

  void onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void verifyOtp() {
    
    String otp = controllers.map((e) => e.text).join();
       bool isSuccess = true; 

    showStatusDialog(isSuccess);

    print("Verifying OTP: $otp");
    // Get.toNamed(Routes.SUCCESS);
  }

  void resendOtp() {
    print("Resending OTP...");
  }
void showStatusDialog(bool isSuccess) {
    Get.bottomSheet(
      StatusDialog(isSuccess: isSuccess),
      isDismissible: !isSuccess, // Don't allow dismiss if it's auto-navigating
      enableDrag: false,
    );

    // After 3 seconds, perform action
    Future.delayed(const Duration(seconds: 3), () {
      if (isSuccess) {
        // Navigate to next page (e.g., Create mPIN)
        Get.offAllNamed('/generate-mpin'); 
      } else {
        // Close dialog if error
        Get.back(); 
      }
    });
  }
  @override
  void onClose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }


  // void showStatusDialog({required bool isSuccess}) {
  //   Get.dialog(
  //     Dialog(
  //       backgroundColor: Colors.transparent,
  //       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: Container(
  //         width: double.infinity,
  //         decoration: const BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.all(Radius.circular(40)),
  //         ),
  //         padding: const EdgeInsets.all(30),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             // Icon mapped to your asset names
  //             Image.asset(
  //               isSuccess 
  //                 ? 'asserts/images/success logo for dialogbox.png' 
  //                 : 'asserts/images/error logo for dialogbox.png',
  //               height: 100,
  //             ),
  //             const SizedBox(height: 20),
  //             // Title text: Size 20, Color 323232
  //             Text(
  //               isSuccess ? "Congralutions!" : "Verification Failed",
  //               style: const TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //                 color: Color(0xFF323232),
  //               ),
  //             ),
  //             const SizedBox(height: 10),
  //             // Subtitle text: Size 16, Color 4F4F4F
  //             Text(
  //               isSuccess 
  //                 ? "Verification is complete\nYou can create your mPIN" 
  //                 : "The code you entered is invalid.\nPlease try again.",
  //               textAlign: TextAlign.center,
  //               style: const TextStyle(
  //                 fontSize: 16,
  //                 color: Color(0xFF4F4F4F),
  //               ),
  //             ),
  //             const SizedBox(height: 30),
  //             // Optional: Close or Continue button
  //             if (!isSuccess) 
  //               TextButton(
  //                 onPressed: () => Get.back(), 
  //                 child: const Text("Try Again")
  //               ),
  //           ],
  //         ),
  //       ),
  //     ),
  //     barrierDismissible: true,
  //   );
  // }

}

