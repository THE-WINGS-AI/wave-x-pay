import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:xtpay/app/widgets/qr_code_custom_painter.dart';

import '../controllers/qr_scan_controller.dart';

class QrScanView extends GetView<QrScanController> {
  final QrScanController qrScanController = Get.put(QrScanController());
  QrScanView({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => qrScanController.isSearching.value ? _buildContactSelectionView() : _buildCameraView(context)),
    );
  }
// SCREEN 1: Camera Scanner
  Widget _buildCameraView(BuildContext context) {
    return Stack(
      children: [
        // Camera Feed
        qrScanController.isInitialized.value 
            ? Positioned.fill(child: CameraPreview(qrScanController.cameraController!)) 
            : Container(color: Colors.black),

        // 1. App Bar with Title
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Get.back(),
              ),
              const Expanded(
                child: Text(
                  "Scan QR Code & Pay",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 48), // Balance for the back button
            ],
          ),
        ),

        // 2. Custom QR Boundary Overlay
        _buildCameraOverlay(),
   Positioned(
  bottom: 100,
  left: 20,
  right: 20,
  child: GestureDetector(
    onTap: qrScanController.toggleView,
    child: Container(
      height: 50, // Height matching your screenshot (346 x 50)
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // Rounded corners
        border: Border.all(
          color: const Color(0xFFE0E0E0), // Subtle light grey border
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // The Search Icon from your utilities
          Image.asset(
            'asserts/images/bottomnavbar utilities icon notselected.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Enter name or number",
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),
      ],
    );
  }

  Widget _buildCameraOverlay() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        
          Stack(
            alignment: Alignment.center,
            children: [
              // Custom L-shaped corners
              CustomPaint(
                size: const Size(250, 250),
                painter: QRScannerPainter(),
              ),
             
            ],
          ),
        ],
      ),
    );
  }
  // SCREEN 1: Camera Scanner
  // Widget _buildCameraView(BuildContext context) {
  //   return Stack(
  //     children: [
  //       // Camera Feed
  //       qrScanController.isInitialized.value ? Positioned.fill(child: CameraPreview(qrScanController.cameraController!)) : Container(color: Colors.black),

  //       // Custom Overlay Assets
  //       _buildCameraOverlay(),

  //       // Bottom Search Bar
      

  //       // App Bar
  //       Positioned(
  //         top: 40,
  //         left: 10,
  //         child: IconButton(
  //           icon: const Icon(Icons.arrow_back, color: Colors.white),
  //           onPressed: () => Get.back(),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // SCREEN 2 & 3: Contact Selection
  Widget _buildContactSelectionView() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFFF5D00), Color(0xFFFFFFFF)],
          stops: [-0.14, 0.88],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildSelectionHeader(),
            const SizedBox(height: 20),
            _buildContactInputArea(),
            const SizedBox(height: 30),
            _buildContactList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: qrScanController.toggleView,
          ),
          const Expanded(
            child: Text(
              "Select Contact",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

Widget _buildContactInputArea() {
  return Stack(
    alignment: Alignment.bottomCenter,
    clipBehavior: Clip.none,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 100),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15), // Adjusted for the softer rectangular look
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          onChanged: (v) => qrScanController.searchText.value = v,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Enter name or number",
            hintStyle: const TextStyle(
              color: Color(0xFF8E8E93),
              fontSize: 16,
            ),
            border: InputBorder.none,
            // Search icon on the left
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'asserts/images/bottomnavbar utilities icon notselected.png',
                width: 20,
                height: 20,
              ),
            ),
            // Contact icon on the right
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'asserts/images/qr code contact icon.png', 
                width: 24,
              ),
            ),
          ),
        ),
      ),
      
      // Floating Camera/QR Toggle Icon at the bottom
      
    ],
  );
}
  Widget _buildContactList() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
                  qrScanController.searchText.isEmpty ? "Recent" : "Found (03)",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => _contactTile(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactTile() {
    return GestureDetector(
      onTap:() =>qrScanController.navigateToEnterAmount(),
      child: ListTile(
        leading: const CircleAvatar(backgroundImage: AssetImage('asserts/images/userprofile user image.png')),
        title: const Text("Phillip Bator", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text("Sent ₹26", style: TextStyle(color: Colors.grey)),
        trailing: const Text("17 Feb 2026", style: TextStyle(color: Colors.grey, fontSize: 12)),
      ),
    );
  }

  // HELPERS
  Widget _buildGlassInputField({required String hint, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(hint, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }

  // Widget _buildCameraOverlay() {
  //   return Center(
  //     child: Container(
  //       width: 250,
  //       height: 250,
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.white, width: 2),
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: const Center(
  //         child: Text("scan here to pay", style: TextStyle(color: Colors.white, fontSize: 12)),
  //       ),
  //     ),
  //   );
  // }
}
