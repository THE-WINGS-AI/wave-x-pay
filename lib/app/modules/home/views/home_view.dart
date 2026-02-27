import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117), // Deep dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: Image.network(
          'https://tinyurl.com/wavexpay-placeholder', // Replace with your logo asset
          height: 30,
          errorBuilder: (context, error, stackTrace) => const Text("Wave X Pay", style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Account Balance Warning Card
            _buildBalanceWarningCard(),
            const SizedBox(height: 25),

            // 2. Quick Actions (Grid/Row)
            _buildQuickActions(),
            const SizedBox(height: 25),

            // 3. Car/Vehicle Card
            _buildVehicleCard(),
            const SizedBox(height: 25),

            // 4. Transactions Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Transaction", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("See All", style: TextStyle(color: Colors.blue))),
              ],
            ),

            // 5. Transactions List
            _buildTransactionList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBalanceWarningCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF8C42), Color(0xFFFF5722)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Your account balance is very low", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 5),
          const Text("Keep your balance healthy to enjoy a seamless experience", style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 20),
          const Text("Account Balance", style: TextStyle(color: Colors.white, fontSize: 14)),
          const Text("₹ • • • •", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final List<Map<String, dynamic>> actions = [
      {"icon": Icons.perm_contact_calendar_outlined, "label": "To Contacts"},
      {"icon": Icons.account_balance_outlined, "label": "To Bank"},
      {"icon": Icons.phone_android_outlined, "label": "Recharge"},
      {"icon": Icons.receipt_long_outlined, "label": "Bill Payment"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions.map((action) {
        return Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white.withOpacity(0.1),
              child: Icon(action['icon'], color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(action['label'], style: const TextStyle(color: Colors.white70, fontSize: 11)),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildVehicleCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF4338CA), Color(0xFF6D28D9)]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("MH 12 AB 6549", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                const Text("Axis bank", style: TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 20),
                const Text("Available Balance", style: TextStyle(color: Colors.white70, fontSize: 12)),
                const Text("₹ 3,200", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // Placeholder for the Car Image
          const Icon(Icons.directions_car, size: 80, color: Colors.white24),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    final List<Map<String, dynamic>> txns = [
      {"name": "Apple Store", "sub": "Entertainment", "amt": "- ₹ 5,99", "icon": Icons.apple, "color": Colors.white},
      {"name": "Spotify", "sub": "Music", "amt": "- ₹ 12,99", "icon": Icons.headset, "color": Colors.green},
      {"name": "Money Transfer", "sub": "Transaction", "amt": "₹ 300", "icon": Icons.swap_horiz, "color": Colors.blue},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: txns.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.05),
            child: Icon(txns[index]['icon'], color: txns[index]['color']),
          ),  
          title: Text(txns[index]['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          subtitle: Text(txns[index]['sub'], style: const TextStyle(color: Colors.white54, fontSize: 12)),
          trailing: Text(
            txns[index]['amt'],
            style: TextStyle(
              color: txns[index]['amt'].contains('-') ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  RxInt _currentIndex = 0.obs;

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex.value,
      backgroundColor: const Color(0xFF0D1117),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white54,
      onTap: (index) {
        _currentIndex.value = index;

        switch (index) {
          case 0:
            print("Home tapped");
            break;
          case 1:
            print("Search tapped");
            break;
          case 2:
            print("Statistics tapped");
            break;
          case 3:
            Get.toNamed('/userprofile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Statistics"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
