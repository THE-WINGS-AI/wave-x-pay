import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/enter_amount_controller.dart';

// class EnterAmountView extends GetView<EnterAmountController> {
//   final EnterAmountController enterAmountController = Get.put(EnterAmountController());
//   EnterAmountView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Obx(() {
//         if (enterAmountController.currentStep.value == 3) return _buildSuccessScreen();
//         return _buildPaymentFlowScreen(context);
//       }),
//       bottomSheet: Obx(() {
//         if (controller.currentStep.value == 3) return const SizedBox.shrink();
//         return _buildBottomActionSheet(context);
//       }),
//     );
//   }

//   Widget _buildPaymentFlowScreen(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//           colors: [Color(0xFFFF5D00), Color(0xFFFFFFFF)],
//           stops: [-0.14, 0.88],
//         ),
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             _buildAppBar(),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: Column(
//                   children: [
//                     _buildMainCard(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAppBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         children: [
//           IconButton(icon: const Icon(Icons.arrow_back), onPressed: enterAmountController.back),
//           const Expanded(
//             child: Text("Enter Amount", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           ),
//           const SizedBox(width: 48),
//         ],
//       ),
//     );
//   }

//   Widget _buildMainCard() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 25),
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(35),
//       ),
//       child: Column(
//         children: [
//           const CircleAvatar(radius: 30, backgroundColor: Color(0xFFFF5D00), child: Text("A", style: TextStyle(color: Colors.white, fontSize: 24))),
//           const SizedBox(height: 15),
//           const Text("Abdul Aleem", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('asserts/images/verified icon enter amount page.png', width: 16),
//               const SizedBox(width: 5),
//               const Text("9876543210", style: TextStyle(color: Colors.blue, fontSize: 12)),
//             ],
//           ),
//           const SizedBox(height: 30),
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Obx(() => Text("₹ ${enterAmountController.displayAmount.value}", style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold))),
//               Opacity(
//                 opacity: 0,
//                 child: TextField(
//                   controller: enterAmountController.amountController,
//                   keyboardType: TextInputType.number,
//                   autofocus: true,
//                 ),
//               ),
//             ],
//           ),
//           const Text("add note (optional)", style: TextStyle(color: Colors.grey, fontSize: 12)),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomActionSheet(BuildContext context) {
//     return Padding(
//       // This padding moves the sheet up when the keyboard opens
//       padding: EdgeInsets.only(bottom: 0),
//       child: Container(
//         padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1)],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min, // Essential so it doesn't take full screen
//           children: [
//             if (controller.currentStep.value == 2) ...[
//               const Text("Enter mPIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(4, (index) => _buildPinBox(index)),
//               ),
//               const SizedBox(height: 25),
//             ],
//             _buildBankTile(),
//             const SizedBox(height: 25),
//             _buildGradientButton(),
//           ],
//         ),
//       ),
//     );
//   }
// //   Widget _buildBottomActionSheet(BuildContext context) {
// //     return Container(
// // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),      decoration: const BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
// //       ),
// //       child: Column(
// //         children: [
// //           if (enterAmountController.currentStep.value == 2) ...[
// //             const Text("Enter mPIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
// //             const SizedBox(height: 20),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: List.generate(4, (index) => _buildPinBox(index)),
// //             ),
// //             const SizedBox(height: 25),
// //           ],
// //           _buildBankTile(),
// //           const SizedBox(height: 25),
// //           _buildGradientButton(),
// //         ],
// //       ),
// //     );
// //   }

//   Widget _buildPinBox(int index) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(15),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//         child: Container(
//           alignment: Alignment.center,
//           width: 65,
//           height: 65,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.4),
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: Colors.white.withOpacity(0.5)),
//             boxShadow: [
//               BoxShadow(color: Colors.black.withOpacity(0.05), offset: const Offset(0, 4), blurRadius: 10),
//             ],
//           ),
//           child: TextField(
//             controller: enterAmountController.pinControllers[index],
//             focusNode: enterAmountController.focusNodes[index],
//             onChanged: (v) => enterAmountController.onPinChanged(v, index),
//             textAlign: TextAlign.center,
//             keyboardType: TextInputType.number,
//             obscureText: true,
//             maxLength: 1,
//             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             decoration: const InputDecoration(counterText: "", border: InputBorder.none),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildBankTile() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.withOpacity(0.2)),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: [
//           Image.asset('asserts/images/HDFC bank logo enter amount.png', width: 40),
//           const SizedBox(width: 15),
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Savings Account (xx789)", style: TextStyle(fontWeight: FontWeight.bold)),
//                 Text("View balance", style: TextStyle(color: Color(0xFFFF5D00), fontSize: 12)),
//               ],
//             ),
//           ),
//           const Icon(Icons.keyboard_arrow_down),
//         ],
//       ),
//     );
//   }

//   Widget _buildGradientButton() {
//     return GestureDetector(
//       onTap: enterAmountController.onPayNow,
//       child: Container(
//         width: double.infinity,
//         height: 55,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           gradient: const LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0x85FF5D00), Color(0xFFFF5D00)],
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFF060C8D).withOpacity(0.24),
//               offset: const Offset(0, 20),
//               blurRadius: 40,
//             ),
//           ],
//         ),
//         child: const Center(
//           child: Text("Pay Now", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//         ),
//       ),
//     );
//   }

//   Widget _buildSuccessScreen() {
//     return Container(
//       color: Colors.white,
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset('asserts/images/enter amount success.gif', height: 250),
//            GestureDetector(onTap: () {
//         Get.toNamed('/payment-details');
//       },child: Text("Payment Successful", style: TextStyle(fontSize: 20, color: Colors.grey))),
//            SizedBox(height: 10),
//           Obx(() => Text("₹ ${enterAmountController.displayAmount.value}", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
//            Text("22 Feb 2022, 11:17 am", style: TextStyle(color: Colors.grey)),
//         ],
//       ),
//     );
//   }
// }



class EnterAmountView extends GetView<EnterAmountController> {
  
    final EnterAmountController enterAmountController = Get.put(EnterAmountController());

   EnterAmountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents keyboard from pushing everything awkwardly
      body: Obx(() {
        if (enterAmountController.currentStep.value == 3) return _buildSuccessScreen();
        return _buildPaymentFlowScreen(context);
      }),
    );
  }
Widget _buildMainCard() {
    return Obx(() {
      bool isStep2 = enterAmountController.currentStep.value == 2;
      
      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isStep2) ...[
              // STEP 1 UI
              const CircleAvatar(radius: 30, backgroundColor: Color(0xFFFF5D00), child: Text("A", style: TextStyle(color: Colors.white, fontSize: 24))),
              const SizedBox(height: 10),
             
               Text("Abdul Aleem", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset(
      'asserts/images/verified icon enter amount page.png',
      width: 16,
    ),
                     SizedBox(height: 4),
                   Text("9876543210", style: TextStyle(color: Colors.blue, fontSize: 12)),
                 ],
               ),
              const SizedBox(height: 10),
              _buildAmountInput(),
                          const Divider(height: 5),

            ] else ...[
              // STEP 2 UI: Bank details move here
              _buildStep2Header(),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Debit from", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              const SizedBox(height: 8),
              _buildBankTile(isCompact: true), // Bank tile inside the card
            const Divider(height: 40),
            ],
            // Functional Note Field
            TextField(  readOnly: isStep2, // 👈 KEY LINE

              controller: enterAmountController.noteController,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              decoration: const InputDecoration(
                hintText: "add note (optional)",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildStep2Header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Paying to", style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 8),
        Row(
          children: [
            const CircleAvatar(radius: 20, backgroundColor: Color(0xFFFF5D00), child: Text("A", style: TextStyle(color: Colors.white, fontSize: 14))),
            const SizedBox(width: 10),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Abdul Aleem", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(
      'asserts/images/verified icon enter amount page.png',
      width: 16,
    ),
                     SizedBox(height: 4),
                    Text("9876543210", style: TextStyle(color: Colors.blue, fontSize: 10)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text("₹${enterAmountController.displayAmount.value}", 
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomActionSheet(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Obx(() {
        bool isStep2 = enterAmountController.currentStep.value == 2;
        
        return Container(
          padding: const EdgeInsets.fromLTRB(30, 25, 30, 40),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isStep2) ...[
                const Text("Enter mPIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => _buildPinBox(index)),
                ),
                const SizedBox(height: 25),
              ] else ...[
                // Bank tile at bottom only in Step 1
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Send from", style: TextStyle(color: Colors.grey, fontSize: 13)),
                ),
                const SizedBox(height: 10),
                _buildBankTile(isCompact: false),
                const SizedBox(height: 25),
              ],
              OrangeButton(label: "Pay Now",horizontalPadding: 0, onTap:()=>enterAmountController.onPayNow()),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildBankTile({required bool isCompact}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: isCompact ? 10 : 15),
      decoration: BoxDecoration(
        border: isCompact ? null : Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset('asserts/images/HDFC bank logo enter amount.png', width: 35),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Savings Account (xx789)", 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text("View balance", 
                  style: TextStyle(color: Color(0xFFFF5D00), fontSize: 11, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.blue.shade900),
        ],
      ),
    );
  }
  Widget _buildPaymentFlowScreen(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFFF5D00), Color(0xFFFFFFFF)],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildMainCard(),
                  ),
                  _buildBottomActionSheet(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildMainCard() {
  //   return Obx(() {
  //     bool isStep2 = enterAmountController.currentStep.value == 2;
  //     return AnimatedContainer(
  //       duration: const Duration(milliseconds: 300),
  //       padding: const EdgeInsets.all(20),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(30),
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           if (!isStep2) ...[
  //             const CircleAvatar(radius: 30, backgroundColor: Color(0xFFFF5D00), child: Text("A", style: TextStyle(color: Colors.white, fontSize: 24))),
  //             const SizedBox(height: 10),
  //             const Text("Abdul Aleem", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
  //             const Text("9876543210", style: TextStyle(color: Colors.blue, fontSize: 12)),
  //             const SizedBox(height: 20),
  //             _buildAmountInput(),
  //           ] else ...[
  //             // Step 2 Compact Header
  //             Row(
  //               children: [
  //                 const CircleAvatar(radius: 20, backgroundColor: Color(0xFFFF5D00), child: Text("A", style: TextStyle(color: Colors.white))),
  //                 const SizedBox(width: 10),
  //                 const Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text("Abdul Aleem", style: TextStyle(fontWeight: FontWeight.bold)),
  //                     Text("9876543210", style: TextStyle(color: Colors.blue, fontSize: 10)),
  //                   ],
  //                 ),
  //                 const Spacer(),
  //                 Text("₹${enterAmountController.displayAmount.value}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  //               ],
  //             ),
  //           ],
  //           const Divider(height: 40),
  //           TextField(
  //             controller: enterAmountController.noteController,
  //             textAlign: TextAlign.center,
  //             decoration: const InputDecoration(
  //               hintText: "add note (optional)",
  //               hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
  //               border: InputBorder.none,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  // }


Widget _buildAmountInput() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "₹ ",
        style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
      ),
      IntrinsicWidth(
        child: TextField(
          controller: enterAmountController.amountController,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // only numbers
            LengthLimitingTextInputFormatter(5),     // max 5 digits
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "0",
          ),
        ),
      ),
    ],
  );
} // Widget _buildBottomActionSheet(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: Container(
  //       padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
  //       decoration: const BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Obx(() {
  //             if (enterAmountController.currentStep.value == 2) {
  //               return Column(
  //                 children: [
  //                   const Text("Enter mPIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
  //                   const SizedBox(height: 20),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: List.generate(4, (index) => _buildPinBox(index)),
  //                   ),
  //                   const SizedBox(height: 30),
  //                 ],
  //               );
  //             }
  //             return const SizedBox.shrink();
  //           }),
  //           _buildBankTile(),
  //           const SizedBox(height: 30),
  //           _buildGradientButton(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildPinBox(int index) {
  //   return Container(
  //     alignment: Alignment.center,
  //     width: 60,
  //     height: 60,
      
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(15),
  //       boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
  //       border: Border.all(color: Colors.grey.shade200),
  //     ),
  //     child: TextField(
  //       controller: enterAmountController.pinControllers[index],
  //       focusNode: enterAmountController.focusNodes[index],
  //       onChanged: (v) => enterAmountController.onPinChanged(v, index),
  //       textAlign: TextAlign.center,
  //       keyboardType: TextInputType.number,
  //       obscureText: true,
  //       maxLength: 1,
  //       style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //       decoration: const InputDecoration(counterText: "", border: InputBorder.none),
  //     ),
  //   );
  // }



  Widget _buildPinBox(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          alignment: Alignment.center,
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: TextField(
            controller: enterAmountController.pinControllers[index],
            focusNode: enterAmountController.focusNodes[index],
            onChanged: (v) => enterAmountController.onPinChanged(v, index),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            obscureText: true,
            maxLength: 1,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
  // Widget _buildBankTile() {
  //   return Container(
  //     padding: const EdgeInsets.all(15),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.grey.shade200),
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: const Row(
  //       children: [
  //         Icon(Icons.account_balance, color: Colors.blue, size: 30),
  //         SizedBox(width: 15),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text("Savings Account (xx789)", style: TextStyle(fontWeight: FontWeight.bold)),
  //               Text("View balance", style: TextStyle(color: Color(0xFFFF5D00), fontSize: 12)),
  //             ],
  //           ),
  //         ),
  //         Icon(Icons.keyboard_arrow_down),
  //       ],
  //     ),
  //   );
  // }



  Widget _buildSuccessScreen() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xFFFF5D00), Color(0xFFFFFFFF)],
          stops: [0.0, 1.0], // Matches your linear-gradient request
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Payment Successful", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 10),
          Obx(() => Text("₹${enterAmountController.displayAmount.value}", style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white))),
          const Text("22 Feb 2022, 11:17 am", style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 50),
          // Simple Button to go to next page manually
          // ElevatedButton(
          //   onPressed: () => Get.offNamed('/payment-details'),
          //   child: const Text("Done"),
          // )
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        IconButton(icon: const Icon(Icons.arrow_back), onPressed: enterAmountController.back),
        const Expanded(child: Text("Enter Amount", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        const SizedBox(width: 48),
      ],
    );
  }
}