import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/dth_controller.dart';

class DthView extends GetView<DthController> {
final DthController dthController = Get.put(DthController());
   DthView({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2EB), // Standard background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text("TV Services", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildServiceToggle(),
            const SizedBox(height: 25),
            _buildInputCard(),
            const SizedBox(height: 30),
            _buildSavedConnections(),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceToggle() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15), // Inner gap between border and blue pill
    decoration: BoxDecoration(
      color: Colors.white, 
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Obx(() => Row(
      children: [
        _toggleButton("DTH", 0),
        _toggleButton("Cable TV", 1),
      ],
    )),
  );
}

Widget _toggleButton(String label, int index) {
  // Use .value to observe changes in Obx
  bool isSelected = dthController.selectedServiceIndex.value == index;
  
  return Expanded(
    child: GestureDetector(
      onTap: () => dthController.toggleService(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7,),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF333DFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(30), // High radius for pill shape
        ),
        child: Center( // Ensures text is perfectly centered
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    ),
  );
}
  Widget _buildInputCard() {
    return Obx(() {
      bool isDth = dthController.selectedServiceIndex.value == 0;
      return Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isDth ? "Select Provider" : "Select Cable TV Provider", style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 10),
            _buildDropdown(isDth),
            const SizedBox(height: 20),
            Text(isDth ? "Subscriber ID/Mobile Number" : "Account Number", style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 10),
            _buildTextField(isDth),
            const SizedBox(height: 30),
            OrangeButton(label: isDth ? "View Plans" : "Fetch bill detailes", onTap: ()=> dthController.processRequest(),horizontalPadding: 5,)
          ],
        ),
      );
    });
  }

  Widget _buildDropdown(bool isDth) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5D00).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(isDth ? "Choose your DTH provider" : "Choose your cable TV provider"),
          isExpanded: true,
          items: (isDth ? dthController.dthProviders : dthController.cableProviders).map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (v) => dthController.selectedProvider.value = v!,
        ),
      ),
    );
  }

  Widget _buildTextField(bool isDth) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5D00).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: dthController.idController,
        decoration: InputDecoration(
          hintText: isDth ? "Enter your subscriber ID/Mobile number" : "Enter your account number",
          border: InputBorder.none,
          suffixIcon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildActionButton(bool isDth) {
    return GestureDetector(
      onTap: dthController.processRequest,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [Color(0xFFFF5D00), Color(0xFFFF8C4B)]), // Orange gradient
          boxShadow: [BoxShadow(color: const Color(0xFF060C8D).withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 10))],
        ),
        child: Center(
          child: Text(
            isDth ? "View Plans" : "Fetch bill detailes", // Spelling matched to image
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }

Widget _buildSavedConnections() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Saved Connections", 
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey)
      ),
      const SizedBox(height: 15),
      // Tata Play with Gradient 1
      _connectionTile(
        "Tata Play", 
        "1234567890", 
        const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00068B), Color(0xFF0F19F7)],
          stops: [0.0442, 0.8639],
        ), 
        'home icon electricity.png'
      ),
      // Airtel Digital TV with Gradient 2
      _connectionTile(
        "Airtel Digital TV", 
        "1234567890", 
        const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF5D00), Color(0xFFED884E)],
          stops: [0.115, 0.9421],
        ), 
        'office icon electricity.png'
      ),
    ],
  );
}

Widget _connectionTile(String title, String sub, Gradient gradient, String icon) {
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
            // Updated to use the specific gradient
            gradient: gradient,
            // Updated to circular shape
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'asserts/images/$icon', 
            width: 24, 
            color: Colors.white
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Colors.grey),
      ],
    ),
  );
}
}