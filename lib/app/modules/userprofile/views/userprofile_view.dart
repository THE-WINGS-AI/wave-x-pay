import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/userprofile_controller.dart';

class UserprofileView extends GetView<UserprofileController> {
  final UserprofileController userprofileController= Get.put(UserprofileController());
   UserprofileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          // Background linear-gradient as requested
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [-0.1483, 0.8855],
            colors: [Color(0xFFFF5D00), Color(0xFFFFFFFF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildProfileCard(),
                      const SizedBox(height: 30),
                      _buildActionGrid(),
                      const SizedBox(height: 30),
                      _buildSettingsSheet(),
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
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF323232)),
          onPressed: () => Get.back(),
        ),
        const Text(
          "Account",
          style: TextStyle(
            fontSize: 18, 
            color: Color(0xFF1D232E), 
            fontWeight: FontWeight.bold,
          ),
        ),
        // Updated Logout/Turn-off button
        GestureDetector(
          onTap: () {
            Get.offAllNamed('/welcome');
            // Add your logout logic here
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16), // Rounded square (squircle)
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.4), // The soft white glow effect
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'asserts/images/userprofile turnoff image.png',
                width: 24, // Size of the orange icon inside
                height: 24,
                // If the asset is black, uncomment the line below to make it orange
                // color: const Color(0xFFFF5722), 
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildProfileCard() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: 190,
          margin:  EdgeInsets.symmetric(horizontal: 20),
          padding:  EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.transparent, // This ensures the card is visible even if the image fails
            image: DecorationImage(
      image: AssetImage("asserts/images/user profile background.png"),
      fit: BoxFit.cover,
    ),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
             Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('asserts/images/userprofile user image.png'),
                    ),
                    const SizedBox(height: 5), // Space instead of Positioned
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('asserts/images/cross icon userprofilr.png', width: 12),
                        const Text("Unverified", style: TextStyle(color: Colors.red, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ],
            ), const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Anuj", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Text("86______09", style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 5),
                      Image.asset('asserts/images/true icon userprofile.png', width: 14),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("xxxxx@gmail.com", style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 5),
                      Image.asset('asserts/images/true icon userprofile.png', width: 14),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        // Edit Icon with negative padding and border as requested
        Positioned(
          bottom: 10,
          child: GestureDetector(
            onTap: () {
              userprofileController.navigateToEditUserProfile();
            },
            child: Container(
  width: 55, // Set explicit size for the circle
  height: 55,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    // 1. The Figma Gradient
    gradient: const LinearGradient(
      begin: Alignment(0.7, -0.8), // Approx 313 degrees
      end: Alignment(-0.7, 0.8),
      colors: [
        Color(0xFF060C8D),           // #060C8D at 28.38%
        Color(0xAEFF5D00),           // #FF5D00 with 0.68 opacity at 117%
      ],
      stops: [0.28, 1.0],
    ),
    // 2. Simulating Inner Shadows (Standard BoxShadow is outer only)
    // To truly get "inset" in standard Flutter, we use the shadow as an outer glow 
    // or wrap it in a clip. Below is the closest "glow" approximation:
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: Center(
    child: Image.asset(
      'asserts/images/userprofile edit icon.png', 
      width: 28, // Adjusted to fit nicely inside the 60px circle
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.edit, color: Colors.white),
    ),
  ),
),
          ),
        ),
      ],
    );
  }

  Widget _buildActionGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionItem('user profile help icon.png', 'Upgrade KYC'),
          _actionItem('user profile settings icon.png', 'Change PIN'),
          _actionItem('user profile myqr icon.png', 'My QR Code'),
          _actionItem('user profile help icon.png', 'Help & Support'),
        ],
      ),
    );
  }

  Widget _actionItem(String icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            // Custom ringshadow as requested
            boxShadow: const [
              BoxShadow(color: Color(0x33FF5D00), blurRadius: 7, spreadRadius: 1, offset: Offset(1, 1)),
            ],
          ),
          child: Image.asset('asserts/images/$icon',errorBuilder: (context, error, stackTrace) => Icon(Icons.error), width: 30),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 70,
          child: Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }

  Widget _buildSettingsSheet() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        // Radial-gradient for the sheet as requested
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        gradient: RadialGradient(
          center: const Alignment(-0.87, -0.95), // 6.62% 2.73%
          radius: 2.3,
          colors: [Colors.white, Colors.white.withOpacity(0.8)],
        ),
      ),
      child: Column(
        children: [
          // _listTile('user profile wallet icon.png', 'Accounts', 'Manage your accounts'),
          _listTile('user profile language icon.png', 'Language', 'Change app language'),
          _listTile('user profile lock icon.png', 'Screen Lock', 'Manage Touch ID or Face ID'),
          _buildThemeTile(),
          const SizedBox(height: 40),
          const Text("Powered by", style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          Image.asset('asserts/images/userprofile logo.png',errorBuilder: (context, error, stackTrace) => Icon(Icons.error), width: 100),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _listTile(String icon, String title, String sub) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _iconBox(icon),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildThemeTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _iconBox('user profile light icon.png'),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Light Mode", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Switch between light & dark mode", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Obx(() => Switch(
                value: userprofileController.isDarkMode.value,
                onChanged: (v) => userprofileController.toggleDarkMode(v),
                activeColor: const Color(0xFF060C8D),
              )),
        ],
      ),
    );
  }
Widget _iconBox(String iconPath) {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Rounded square look

      boxShadow: [
        BoxShadow(
          color:  Color(0xFFFFE8E0).withOpacity(0.5), // Soft orange/pink shadow from image
          blurRadius: 15,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Center(
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFF00068A), // Your requested background color
          borderRadius: BorderRadius.circular(12), // Rounded square look
        ),
        padding: const EdgeInsets.all(10), // Adjust padding to size your icon
        child: Image.asset(errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
        'asserts/images/$iconPath',
          color: Colors.white, // Ensures the "icon only" asset shows up white
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
  
}