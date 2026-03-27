import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';

import '../controllers/electricity_controller.dart';

class ElectricityView extends GetView<ElectricityController> {
  final ElectricityController electricityController = Get.put(ElectricityController());
   ElectricityView({super.key});
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
          "Electricity Bill",
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
              "Recent Recharges",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildRecentBillsList(),
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
          _buildLabel("Select State"),
          _buildDropdown(electricityController.selectedState, electricityController.states),
          const SizedBox(height: 20),
          _buildLabel("Select Provider"),
          _buildDropdown(electricityController.selectedProvider, electricityController.providers),
          const SizedBox(height: 20),
          _buildLabel("Consumer Number"),
          _buildTextField(),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.lightbulb_outline, size: 16, color: Colors.amber),
              const SizedBox(width: 5),
              const Text("You can find Consumer ID on your bill", 
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 30),
          OrangeButton(label:  "Fetch Bill", onTap: () => electricityController.fetchBill(),horizontalPadding: 5,),
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

  Widget _buildDropdown(RxString value, List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF5D00).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value.value,
          isExpanded: true,
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: (v) => value.value = v!,
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
        controller: electricityController.consumerIdController,
        decoration: const InputDecoration(
          hintText: "Enter Consumer ID",
          border: InputBorder.none,
        ),
      ),
    );
  }

Widget _buildRecentBillsList() {
  final recentBills = [
    {
      "name": "Home",
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
      "icon": "office icon electricity.png",
      "gradient": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFF5D00), Color(0xFFED884E)],
        stops: [0.115, 0.9421],
      ),
    },
    {
      "name": "Home",
      "icon": "call icon recharge.png",
      "gradient": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFED1E79), Color(0xFF871145)],
        stops: [-0.0372, 0.9929],
      ),
    },
  ];

  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: recentBills.length,
    itemBuilder: (context, index) {
      final bill = recentBills[index];
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
                // 1. Applied the Gradient
                gradient: bill['gradient'] as LinearGradient,
                // 2. Changed to Circular Shape
                shape: BoxShape.circle, 
              ),
              child: Image.asset(
                'asserts/images/${bill['icon']}', 
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
                    bill['name'] as String, 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Text(
                    "879019XXXXX", 
                    style: TextStyle(color: Colors.grey, fontSize: 12),
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
}
}