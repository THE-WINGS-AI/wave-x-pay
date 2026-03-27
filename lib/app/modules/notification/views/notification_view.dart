import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  final NotificationController notificationController = Get.put(NotificationController());
   NotificationView({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2EB), // Main background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _buildTabFilter(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildAIInsightCard(),
                const SizedBox(height: 25),
                _buildNotificationTile(
                  icon: 'notification recive icon.png',
                  title: "Payment Received",
                  desc: "You received ₹450 from Priya Jain.",
                  time: "2m ago",
                  isNew: true,
                  buttonLabel: "View Details",
                ),
                _buildNotificationTile(
                  icon: 'notification info icon.png',
                  title: "Payment Due Soon",
                  desc: "Your credit card payment of ₹1200 is due in 3 days.",
                  time: "2m ago",
                  isNew: true,
                  isActionable: true,
                  buttonLabel: "Pay Now",
                ),
                _buildNotificationTile(
                  icon: 'notification offer icon.png',
                  title: "Exclusive Cashback Offer",
                  desc: "Get 5% cashback on app dining purchases this month",
                  time: "2m ago",
                  buttonLabel: "View Details",
                ),
                _buildNotificationTile(
                  icon: 'notification offer icon.png',
                  title: "Exclusive Cashback Offer",
                  desc: "Get 5% cashback on app dining purchases this month",
                  time: "2m ago",
                  buttonLabel: "View Details",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabFilter() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: notificationController.tabs.map((tab) => Obx(() {
          bool isSelected = notificationController.selectedTab.value == tab;
          return GestureDetector(
            onTap: () => notificationController.changeTab(tab),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF2E36FF) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tab,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ),
          );
        })).toList(),
      ),
    );
  }

  Widget _buildAIInsightCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // Requested AI background gradient
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2E36FF), Color(0xFF00068B)],
          stops: [-0.0584, 0.3864],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Image.asset('asserts/images/notification ai icon.png', width: 24),
              ),
              const SizedBox(width: 12),
              const Text("AI Insight", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "Your spending is 15% lower this month. You saved ₹5,000 on dining, great job!",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5D00),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("View Full Report", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Icon(Icons.chevron_right, color: Colors.white),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNotificationTile({
    required String icon,
    required String title,
    required String desc,
    required String time,
    required String buttonLabel,
    bool isNew = false,
    bool isActionable = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon background
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: const Color(0xFF00068B), borderRadius: BorderRadius.circular(8)),
                child: Image.asset('asserts/images/$icon', width: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        if (isNew) ...[
                          const SizedBox(width: 5),
                          const CircleAvatar(radius: 3, backgroundColor: Color(0xFF2E36FF)),
                        ]
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(desc, style: const TextStyle(color: Colors.black87, fontSize: 13)),
                  ],
                ),
              ),
              Text(time, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isActionable ? const Color(0xFFFF5D00) : const Color(0xFFF2F4FA),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(buttonLabel, style: TextStyle(color: isActionable ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 5),
                  Icon(Icons.chevron_right, size: 16, color: isActionable ? Colors.white : Colors.black),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}