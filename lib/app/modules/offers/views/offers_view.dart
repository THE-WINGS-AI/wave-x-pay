import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/offers_controller.dart';

class OffersView extends GetView<OffersController> {


  final OffersController offersController = Get.put(OffersController());
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 28),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 25),
            _buildExpiringRewardBanner(),
            const SizedBox(height: 30),
            _buildCategoryTabs(),
            const SizedBox(height: 25),
            
            // ₹100 Cashback Card
            _buildOfferCard(
              backgroundImage: 'asserts/images/100cashback background.png',
              iconImage: 'asserts/images/100cashback icon.png',
              title: "₹100 Cashback",
              subtitle: "Recharge above ₹399 on mobile recharge",
              validity: "Valid till 30 Jan",
              buttonLabel: "Claim Offer",
            ),
            
            const SizedBox(height: 20),
            
            // 10% Off Card
            _buildOfferCard(
              backgroundImage: 'asserts/images/75cashback background.png',
              iconImage: 'asserts/images/75cashback icon.png',
              title: "Flat 10% Off",
              subtitle: "Electricity bill payment Up to ₹75 cashback",
              validity: "Ends in 2 days",
              buttonLabel: "Pay bills",
            ),
            
            const SizedBox(height: 30),
            const Text(
              "Friday, 12 August, 2025",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            
            // Earned Cash Card
            _buildEarnedCashCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good morning,", style: TextStyle(color: Colors.grey, fontSize: 16)),
            Text("Anuj Gupta", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('asserts/images/userprofile user image.png'),
        ),
      ],
    );
  }

  Widget _buildExpiringRewardBanner() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFEEDFF), // gift background color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset('asserts/images/offers gift icon.png', width: 40),
          const SizedBox(width: 15),
          const Expanded(
            child: Text.rich(
              TextSpan(
                text: "Your reward is expiring soon. ",
                style: TextStyle(fontSize: 13),
                children: [
                  TextSpan(
                    text: "Redeem now",
                    style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                  ),
                  TextSpan(text: " to enjoy the cash points"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: offersController.categories.map((cat) {
          bool isSelected = offersController.selectedCategory.value == cat;
          return GestureDetector(
            onTap: () => offersController.changeCategory(cat),
            child: Container(
              margin: const EdgeInsets.only(right: 25),
              padding: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: isSelected ? const Border(bottom: BorderSide(color: Color(0xFF00C853), width: 2)) : null,
              ),
              child: Text(
                cat,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ));
  }

  Widget _buildOfferCard({
    required String backgroundImage,
    required String iconImage,
    required String title,
    required String subtitle,
    required String validity,
    required String buttonLabel,
  }) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
                color: Colors.transparent,

        image: DecorationImage(image: AssetImage(backgroundImage), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Image.asset(iconImage, width: 80),
            const SizedBox(width: 15),
       Expanded(
  child: Padding(
    padding: EdgeInsetsGeometry.only(top: 10),
    child: Column(
      
      crossAxisAlignment: CrossAxisAlignment.start, // Keeps title/subtitle on the left
      children: [
        // Top Section: Title and Subtitle
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        
        // This pushes everything below it to the bottom
        const Spacer(), 
        
        // Bottom Section: Aligned to the right
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(validity, style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.bold)),
              SizedBox(height: 1,),
              _buildClaimButton(buttonLabel),
            ],
          ),
        ),
      ],
    ),
  ),
)  ],
        ),
      ),
    );
  }

  Widget _buildEarnedCashCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: const DecorationImage(image: AssetImage('asserts/images/cashback background.png'), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset('asserts/images/cashback icon.png', width: 80),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("You've earned ₹22 Uprides cash", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const Text("Redeemed and added to wallet", style: TextStyle(color: Colors.grey, fontSize: 11)),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: const Text("Added to wallet", style: TextStyle(color: Colors.grey, fontSize: 10)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildClaimButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
       color: Color(0xFFFF5D00),
        // gradient: const LinearGradient(colors: [Color(0xFFFF5D00), Color(0xFFFF8C4B)]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }
}