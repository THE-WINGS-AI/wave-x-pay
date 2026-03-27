import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/gasbill_controller.dart';

class GasbillView extends GetView<GasbillController> {
  final GasbillController gasbillController = Get.put(GasbillController());
   GasbillView({super.key});
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
          "Gas Bill",
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
            _buildMainInputCard(),
            const SizedBox(height: 30),
            const Text(
              "Recent Connections",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildRecentConnectionsList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMainInputCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel("Select Gas Provider"),
          _buildDropdown(),
          const SizedBox(height: 20),
          _buildLabel("LPG ID/ Consumer Number"),
          _buildTextField(),
          const SizedBox(height: 10),
          const Text(
            "You can find this on your gas connection booklet",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 30),
                    OrangeButton(label:  "Fetch Bill", onTap: () => gasbillController.fetchBill(),horizontalPadding: 5,),

          // _buildFetchButton(),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(color: Colors.grey, fontSize: 14)),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5D00).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: gasbillController.selectedProvider.value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: gasbillController.providers.map((String provider) {
            return DropdownMenuItem<String>(
              value: provider,
              child: Text(provider, style: TextStyle(
                color: provider.contains("Choose") ? Colors.grey : Colors.black,
              )),
            );
          }).toList(),
          onChanged: (value) => gasbillController.selectedProvider.value = value!,
        ),
      )),
    );
  }

  Widget _buildTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5D00).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: gasbillController.consumerNumberController,
        decoration: const InputDecoration(
          hintText: "Enter your consumer number",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }


Widget _buildRecentConnectionsList() {
  final recent = [
    {
      "name": "Home",
      "provider": "Indane Gas",
      "icon": "home icon electricity.png",
      "gradient": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF00068B), Color(0xFF0F19F7)],
        stops: [0.0442, 0.8639],
      ),
    },
    {
      "name": "Office",
      "provider": "HP Gas",
      "icon": "office icon electricity.png",
      "gradient": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFF5D00), Color(0xFFED884E)],
        stops: [0.115, 0.9421],
      ),
    },
  ];

  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: recent.length,
    itemBuilder: (context, index) {
      final item = recent[index];
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
                // Applied the specific LinearGradient
                gradient: item['gradient'] as LinearGradient,
                // Changed to circular shape
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'asserts/images/${item['icon']}', 
                width: 24, 
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'] as String, 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "${item['provider']} • 1234567890", 
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      );
    },
  );
}}