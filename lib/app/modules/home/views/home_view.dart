import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'dart:ui';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F2), // Light cream background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildHeader(),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildWalletCard(),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildQuickActions(),
              ),
const SizedBox(height: 15),

_buildFASTagBanner(), 

const SizedBox(height: 10),              

              Stack(
                clipBehavior: Clip.none, // Allows the card to "pop out" of the stack boundaries
                alignment: Alignment.topCenter,
                children: [
                  // 1. THE GLASS CONTAINER (Background)
                  Padding(
                    padding: const EdgeInsets.only(top: 50), // Creates space for the card to sit into
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 120, bottom: 30), // Extra top padding to clear the card
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            gradient: RadialGradient(
                              center: const Alignment(-0.87, -0.95),
                              radius: 2.3,
                              colors: [
                                Colors.white.withOpacity(1.0),
                                Colors.white.withOpacity(0.8),
                              ],
                            ),
                            border: Border.all(
                              color: const Color(0x4DFFFFFF),
                              width: 2.14,
                            ),
                          ),
                          child: Column(
                            children: [
                              // Service Grid stays inside the container
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: _buildServiceGrid(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 2. THE BUDGET CARD (Floating)
                  Positioned(
                    top: 0, // Aligns to the very top of the Stack
                    left: 20,
                    right: 20,
                    child: _buildBudgetSection(), // This now sits half-on, half-off the container
                  ),
                ],
              )
              // _buildBudgetSection(),
              // const SizedBox(height: 30),
              // _buildServiceGrid(),
              // const SizedBox(height: 100), // Space for bottom nav
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed('/userprofile'),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('asserts/images/user profile icon existing login.png'),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              "Hi, Anuj!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Get.toNamed('/notification'),
          child: Image.asset('asserts/images/home notification icon.png', width: 65),
        ),
      ],
    );
  }
Widget _buildFASTagBanner() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 7),
    width: double.infinity,
    height: 190, // Fixed height to match the aspect ratio
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.transparent,
    ),
    child: Stack(
      children: [
        // The Car Image (Positioned to the right)
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          top: 0,
          child: Image.asset(
            'asserts/images/home hero image with car.png',
            fit: BoxFit.contain,
          ),
        ),
        // The Text Content
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "New feature",
                  style: TextStyle(
                    color: Color(0xFF060C8D),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "FASTag - Coming Soon",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "Link your vehicle & pay tolls automatically.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 6),
              // Notify Me Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF060C8D),
                  foregroundColor: Colors.white,
                  padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:  Text("Notify Me", style: TextStyle(fontSize: 9),),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
  Widget _buildWalletCard() {
    return Container(
      width: double.infinity,
      height: 175,
      padding: const EdgeInsets.only(top: 40.0, bottom: 40.0, right: 25.0, left: 25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('asserts/images/home balance background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.asset('asserts/images/home wallet icon.png', width: 18),
                    const SizedBox(width: 8),
                    const Text("Wallet - xx234", style: TextStyle(color: Colors.white, fontSize: 12)),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => Row(
                    children: [
                      Text(
                        homeController.isBalanceVisible.value ? "\₹3748.98" : "\₹ •••••••",
                        style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        icon: Icon(
                          homeController.isBalanceVisible.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: homeController.toggleBalance,
                      ),
                    ],
                  )),
            ],
          ),
          Column(
            children: [
              Image.asset('asserts/images/home add money icon.png', width: 55),
              const SizedBox(height: 8),
              const Text("Add Money", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _actionItem('asserts/images/home send icon.png', 'Pay'),
        _actionItem('asserts/images/home recieve icon.png', 'Receive'),
        _actionItem('asserts/images/home history icon.png', 'History'),
        _actionItem('asserts/images/home wallet icon 2.png', 'Accounts'), // Reusing wallet icon as placeholder
      ],
    );
  }

  Widget _actionItem(String asset, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            // Your requested Border: 2px solid #FF5D0021
            border: Border.all(
              color: const Color(0x21FF5D00),
              width: 2,
            ),
            // Your requested Drop Shadow: 0px 3px 25px 5px #FF5D0040
            boxShadow: [
              BoxShadow(
                color: const Color(0x40FF5D00),
                offset: const Offset(0, 3),
                blurRadius: 25,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Image.asset(asset, width: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildBudgetSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Increased to match the image's softer corners
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000), // #00000026 (15% opacity)
            offset: const Offset(0, -1), // 0px horizontal, -1px vertical
            blurRadius: 5, // 5px blur
            spreadRadius: 0, // 0px spread
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon Container to match the soft green background in your image
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset('asserts/images/home budget icon.png', width: 24),
              ),
              const SizedBox(width: 12),
              const Text("Budget", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A))),
              const Spacer(),
              const Text("▲ 3.2%", style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _budgetText("My Spend", "₹789"),
              _budgetSecoundText("Set Budget", "₹1000", alignment: CrossAxisAlignment.end),
            ],
          ),
        ],
      ),
    );
  }
  // Widget _buildBudgetSection() {
  //   return Container(
  //     padding: const EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(30),
  //       boxShadow: [
  //       BoxShadow(
  //         color: const Color(0x26000000), // #00000026 (15% opacity)
  //         offset: const Offset(0, -1),   // 0px horizontal, -1px vertical
  //         blurRadius: 5,                 // 5px blur
  //         spreadRadius: 0,               // 0px spread
  //       ),
  //     ],
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           children: [
  //             Image.asset('asserts/images/home budget icon.png', width: 40),
  //             const SizedBox(width: 12),
  //             const Text("Budget", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  //             const Spacer(),
  //             const Text("▲ 3.2%", style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             _budgetText("My Spend", "\₹789"),
  //             _budgetText("Set Budget", "\₹1000", alignment: CrossAxisAlignment.end),
  //           ],
  //         ),
  //         const SizedBox(height: 10),
  //         LinearProgressIndicator(
  //           value: 0.789,
  //           backgroundColor: Colors.grey[200],
  //           color: const Color(0xFF00C853),
  //           borderRadius: BorderRadius.circular(10),
  //           minHeight: 8,
  //         )
  //       ],
  //     ),
  //   );
  // }

  static Widget _budgetText(String title, String val, {CrossAxisAlignment alignment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(val, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  static Widget _budgetSecoundText(String title, String val, {CrossAxisAlignment alignment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(val, style: const TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildServiceGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 20,
      // Note: Adjusted childAspectRatio if icons feel too squished or spaced
      childAspectRatio: 0.8,
      children: [
        _serviceItem('home reacharge icon.png', 'Recharge', const Color(0xFFD7F4FF), () {
          Get.toNamed('/reacharge');
        }),
        _serviceItem('home electricity icon.png', 'Electricity', const Color(0xFFFFEAF2), () {
          Get.toNamed('/electricity');
        }),
        _serviceItem('home gasbill icon.png', 'Gas Bill', const Color(0xFFDCF7F2), () {
          Get.toNamed('/gasbill');
        }),
        _serviceItem('home waterbill icon.png', 'Water Bill', const Color(0xFFF2F4FA), () {
          Get.toNamed('/waterbill');
        }),
        _serviceItem('home cabletv icon.png', 'Cable TV', const Color(0xFFFFEAF2), () {
          Get.toNamed('/dth');
        }),
        _serviceItem('home datacable icon.png', 'Data Cards', const Color(0xFFD7F4FF), () {
          Get.toNamed('/datacable');
        }),
        _serviceItem('home dth icon.png', 'DTH', const Color(0xFFF2F4FA), () {
          Get.toNamed('/dth');
        }),
        _serviceItem('home seeall icon.png', 'See all', const Color(0xFFDCF7F2), () {
          Get.toNamed('/seeall-home-service');
        }),
      ],
    );
  }

  Widget _serviceItem(String asset, String label, Color bgColor, Function ontap) {
    return GestureDetector(
      onTap: () => ontap(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60, // Increased size slightly to match the design's proportions
            width: 60,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(18), // Softer rounded corners
            ),
            padding: const EdgeInsets.all(13), // Gives the icon space inside the box
            child: Image.asset(
              'asserts/images/$asset',
              fit: BoxFit.cover, // Enx`sures the icon doesn't stretch
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image, color: Colors.grey, size: 20);
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121), // Standard dark grey for text
            ),
            textAlign: TextAlign.center,
            maxLines: 2, // Allows "Water Bill" to wrap if needed
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildFab() {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(color: Color(0xFF060C8D), shape: BoxShape.circle),
      child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, "Home", true),
            _navItem(Icons.swap_horiz, "Transfers", false),
            const SizedBox(width: 40),
            _navItem(Icons.receipt_long, "Utilities", false),
            _navItem(Icons.pie_chart_outline, "Save", false),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? const Color(0xFF060C8D) : Colors.grey),
        Text(label, style: TextStyle(color: active ? const Color(0xFF060C8D) : Colors.grey, fontSize: 10)),
      ],
    );
  }
}
