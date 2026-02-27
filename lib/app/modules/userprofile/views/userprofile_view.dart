import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/userprofile_controller.dart';

class UserprofileView extends GetView<UserprofileController> {
  const UserprofileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFB366), Color(0xFFFDEEE0)], // Orange to light cream
            stops: [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildProfileCard(),
                      const SizedBox(height: 30),
                      _buildQuickActionsGrid(),
                      const SizedBox(height: 30),
                      _buildSettingsList(),
                      const SizedBox(height: 40),
                      _buildFooterLogo(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          const Text(
            "Account",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.power_settings_new, color: Colors.orange),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // Profile Avatar Placeholder
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundColor: Color(0xFFD1C4E9),
                        child: Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.close, size: 10, color: Colors.red),
                              Text("Unverified", style: TextStyle(fontSize: 9, color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Anuj", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text("86_____09", style: TextStyle(color: Colors.grey)),
                          Icon(Icons.check_circle, size: 14, color: Colors.blue),
                        ],
                      ),
                      Row(
                        children: [
                          Text("xxxxx@gmail.com", style: TextStyle(color: Colors.grey)),
                          Icon(Icons.check_circle, size: 14, color: Colors.blue),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        // Edit Button
        Positioned(
          bottom: -25,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFF4A3AFF),
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionsGrid() {
    final List<Map<String, dynamic>> items = [
      {"icon": Icons.person_add_alt_1, "label": "Upgrade KYC"},
      {"icon": Icons.settings_outlined, "label": "Change PIN"},
      {"icon": Icons.qr_code_scanner, "label": "My QR Code"},
      {"icon": Icons.help_outline, "label": "Help & Support"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(items[index]['icon'], color: const Color(0xFF4A3AFF)),
            ),
            const SizedBox(height: 8),
            Text(
              items[index]['label'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSettingsList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          _settingsTile(Icons.wallet, "Accounts", "Manage your accounts"),
          _settingsTile(Icons.language, "Language", "You can change the app language"),
          _settingsTile(Icons.fingerprint, "Screen Lock", "Manage Touch ID or Face ID"),
          _settingsTile(
            Icons.tune,
            "Light Mode",
            "Switch between light & dark mode",
            trailing: Obx(() => Switch(
                  value: controller.isDarkMode.value,
                  onChanged: (val) => controller.toggleDarkMode(val),
                  activeColor: const Color(0xFF000080),
                )),
          ),
        ],
      ),
    );
  }

  Widget _settingsTile(IconData icon, String title, String subtitle, {Widget? trailing}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFF000080)),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }

  Widget _buildFooterLogo() {
    return Column(
      children: [
        const Text("Powered by", style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 5),
        // Placeholder for Wave X Pay Logo
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.waves, color: Colors.orange, size: 20),
            const SizedBox(width: 5),
            Text(
              "Wave X Pay",
              style: TextStyle(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
