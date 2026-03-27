// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/bottom_nav_bar_controller.dart';

// class BottomNavBarView extends GetView<BottomNavBarController> {
//   final BottomNavBarController bottomNavBarController = Get.put(BottomNavBarController());

//   BottomNavBarView({super.key});
// @override
// Widget build(BuildContext context) {
//     return Scaffold(
//       // CHANGE 1: Set this to transparent or white to remove the grey background
//       backgroundColor: Colors.transparent,

//       body: Obx(() => bottomNavBarController.appPages[bottomNavBarController.selectedIndex.value]),

//       extendBody: true,

//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Container(
//         // This decoration handles the white ring/gap around the blue circle
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: Colors.white,
//             width: 5.0,
//           ),
//         ),
//         child: FloatingActionButton(
//           onPressed: () => bottomNavBarController.updateIndex(2),
//           shape: const CircleBorder(),
//           elevation: 0,
//           hoverElevation: 0,
//           focusElevation: 0,
//           highlightElevation: 0,
//           backgroundColor: const Color(0xFF0000A5),
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Image.asset(
//               'asserts/images/bottomnavbar qr icon.png',
//               fit: BoxFit.contain,
//               errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.qr_code_scanner, color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//           boxShadow: [
//             BoxShadow(
//               // color: Color(0x26B8B8D2), // Reduced opacity for a cleaner look
//                             color: Colors.white, // Reduced opacity for a cleaner look

//               blurRadius: 16.08,
//               offset: Offset(0, -2), // Move shadow slightly up to define the edge
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//           child: BottomAppBar(
//             elevation: 0,
//             // CHANGE 2: Ensure notchMargin is consistent
//             notchMargin: 8.0,
//             color: Colors.white,
//             clipBehavior: Clip.antiAlias,
//             shape: const CircularNotchedRectangle(),
//             child: SizedBox(
//               height: 70,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _navItem(0, 'Home', 'Home icon'),
//                   _navItem(1, 'Transfers', 'history icon'),

//                   const SizedBox(width: 48),

//                   _navItem(3, 'Utilities', 'utilities icon'),
//                   _navItem(4, 'Save', 'save icon'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _navItem(int index, String label, String assetName) {
//     return Obx(() {
//       bool isSelected = bottomNavBarController.selectedIndex.value == index;
//       String state = isSelected ? 'selected' : 'notselected';

//       return InkWell(
//         onTap: () => bottomNavBarController.updateIndex(index),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Indicator line
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 200),
//               height: 3,
//               width: 25,
//               decoration: BoxDecoration(
//                 color: isSelected ? const Color(0xFF0000A5) : Colors.transparent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Image.asset(
//               'asserts/images/bottomnavbar $assetName $state.png',
//               width: 24,
//               height: 24,
//               errorBuilder: (context, error, stackTrace) => Icon(
//                 index == 0 ? Icons.home : Icons.circle,
//                 color: isSelected ? const Color(0xFF0000A5) : Colors.grey[400],
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: isSelected ? const Color(0xFF0000A5) : Colors.grey[400],
//                 fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  final BottomNavBarController bottomNavBarController = Get.put(BottomNavBarController());

  BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() => bottomNavBarController.appPages[bottomNavBarController.selectedIndex.value]),
      extendBody: true,
      // REMOVED: floatingActionButton and floatingActionButtonLocation
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none, // Allows the icon to overflow the top
        alignment: Alignment.topCenter,
        children: [
          // 1. The Bottom Navigation Bar
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12, // Subtle shadow
                  blurRadius: 16.08,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: BottomAppBar(
                elevation: 0,
                color: Colors.white,
                // Removed CircularNotchedRectangle since we aren't using FAB anymore
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _navItem(0, 'Home', 'Home icon'),
                      _navItem(1, 'Transfers', 'history icon'),
                      const SizedBox(width: 48), // Gap for the center icon
                      _navItem(3, 'Search', 'utilities icon'),
                      _navItem(4, 'Save', 'save icon'),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 2. The Positioned Icon (Replacing the FAB)
          Positioned(
            top: -15, // This acts as your "minus padding" to lift it up
            child: GestureDetector(
              onTap: () => bottomNavBarController.updateIndex(2),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF0000A5),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -8),
                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'asserts/images/bottomnavbar qr icon.png',
                    width: 30,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.qr_code_scanner, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(int index, String label, String assetName) {
    return Obx(() {
      bool isSelected = bottomNavBarController.selectedIndex.value == index;
      String state = isSelected ? 'selected' : 'notselected';

      return InkWell(
        onTap: () => bottomNavBarController.updateIndex(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 3,
              width: 25,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF0000A5) : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 8),
            Image.asset(
              'asserts/images/bottomnavbar $assetName $state.png',
              width: 24,
              height: 24,
              errorBuilder: (context, error, stackTrace) => Icon(
                index == 0 ? Icons.home : Icons.circle,
                color: isSelected ? const Color(0xFF0000A5) : Colors.grey[400],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? const Color(0xFF0000A5) : Colors.grey[400],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    });
  }
}
