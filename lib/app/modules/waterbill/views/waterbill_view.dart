import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/waterbill_controller.dart';

class WaterbillView extends GetView<WaterbillController> {
  final WaterbillController waterbillController = Get.put(WaterbillController());
   WaterbillView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2EB), // Page Background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text("Water Bill", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMainInputCard(),
            const SizedBox(height: 20),
            _buildPromoCarousel(),
            const SizedBox(height: 25),
            _buildRecentConnections(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainInputCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Select Water Provider", style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFF5D00).withOpacity(0.2)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Obx(() => DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: waterbillController.selectedProvider.value,
                isExpanded: true,
                items: waterbillController.providers.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                onChanged: (v) => waterbillController.selectedProvider.value = v!,
              ),
            )),
          ),
          const SizedBox(height: 30),
          OrangeButton(label: "Fetch Bill", onTap:()=> waterbillController.fetchBill(), horizontalPadding: 5),
        
        ],
      ),
    );
  }

Widget _buildPromoCarousel() {
  final List<Map<String, dynamic>> promoData = [
    {
      "bg": "vi card waterbill.png",
      "title": "Unlock a better\ntomorrow with Vi",
      "sub": "Get exclusive solutions to help\nyou get ahead in life",
      "btn": "Upgrade now →",
      "tc": "*T&C apply",
      "textColor": Colors.black, // Specific color for this card
    },
    {
      "bg": "red waterbill.png",
      "title": "One Family, Big Saving",
      "sub": "Postpaid at just ₹260/connection\nwith Vi Family ₹1299/plan\n300GB data, Disney+ Mobile,\nAmazon Prime & more.",
      "btn": "Upgrade now →",
      "tc": "*T&C apply",
      "textColor": Colors.white, // White text for the red background
    },
    {
      "bg": "blue waterbill.png",
      "title": "Recharge and save\non hospital bills",
      "sub": "Get an assured hospitalization\ncover with hospicare pack",
      "btn": "Recharge now →",
      "tc": "*Applicable on a minimum value ₹500",
      "textColor": Colors.black,
    },
  ];

  return Column(
    children: [
      SizedBox(
        height: 190, // Slightly reduced to keep it compact
        child: PageView.builder(
          controller: waterbillController.pageController,
          onPageChanged: (v) => waterbillController.currentPage.value = v,
          itemCount: promoData.length,
          itemBuilder: (context, index) {
            final promo = promoData[index];
            final Color contentColor = promo['textColor'];

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10), // Reduced margin for better peek
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('asserts/images/${promo['bg']}'), 
                  fit: BoxFit.cover, // Changed to cover to avoid stretching
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes space evenly
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promo['title']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: contentColor,
                          height: 1.2, // Tighter line height
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        promo['sub']!,
                        style: TextStyle(
                          fontSize: 11,
                          color: contentColor.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF222222),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          minimumSize: Size.zero, // Allows button to wrap text tightly
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(promo['btn']!, style: const TextStyle(fontSize: 12)),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        promo['tc']!,
                        style: TextStyle(
                          fontSize: 8,
                          color: contentColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      const SizedBox(height: 12),
      Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(promoData.length, (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: waterbillController.currentPage.value == i ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: waterbillController.currentPage.value == i 
                ? const Color(0xFF060C8D) 
                : Colors.grey[300],
          ),
        )),
      )),
    ],
  );
}
Widget _buildRecentConnections() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Recent Connections", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 15),
        // Home Tile with Gradient 1
        _buildConnectionTile(
          "Home",
          "Indane Gas • 1234567890",
          const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF00068B), Color(0xFF0F19F7)],
            stops: [0.0442, 0.8639],
          ),
          'home icon electricity.png',
        ),
        // Office Tile with Gradient 2
        _buildConnectionTile(
          "Office",
          "HP Gas • 1234567890",
          const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF5D00), Color(0xFFED884E)],
            stops: [0.115, 0.9421],
          ),
          'office icon electricity.png',
        ),
      ],
    ),
  );
}

Widget _buildConnectionTile(String title, String sub, Gradient gradient, String icon) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white, 
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // Changed from color to gradient
            gradient: gradient,
            // Changed from borderRadius to circle
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'asserts/images/$icon', 
            width: 24, 
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Colors.grey),
      ],
    ),
  );
}
}