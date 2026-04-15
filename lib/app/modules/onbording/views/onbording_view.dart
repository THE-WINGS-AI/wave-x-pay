import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtpay/app/widgets/fontsize.dart';
import '../controllers/onbording_controller.dart';

class OnbordingView extends GetView<OnbordingController> {
  final OnbordingController onbordingController = Get.put(OnbordingController());

  OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Bottom Blur Background
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'asserts/images/onbording blur image.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Swipeable Pages
          PageView.builder(
            controller: onbordingController.pageController,
            onPageChanged: onbordingController.currentIndex,
            itemCount: onbordingController.onboardingData.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: CustomHight.h55),

                  // Animated Hero Section
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background Image (The shapes/colors without the person)
                        Image.asset(
                          onbordingController.onboardingData[index]['image']!,
                          width: MediaQuery.of(context).size.width,
                        ),

                        // Floating Person Image
                        _buildFloatingPerson(index),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      onbordingController.onboardingData[index]['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF5D00),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      onbordingController.onboardingData[index]['desc']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF060C8D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // 3. Navigation Controls
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left: Skip or Back
                Obx(() {
                  bool isLast = onbordingController.isLastPage;
                  return TextButton(
                    onPressed: isLast ? onbordingController.previous : onbordingController.skip,
                    child: Text(
                      isLast ? "Back" : "Skip",
                      style: TextStyle(
                        color: isLast ? const Color(0xFF979797) : const Color(0xFF00068B),
                        fontSize: 16,
                      ),
                    ),
                  );
                }),

                // Center: Indicator Dots
                Row(
                  children: List.generate(
                    onbordingController.onboardingData.length,
                    (index) => Obx(() => AnimatedContainer(
                          duration: 300.milliseconds,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: onbordingController.currentIndex.value == index ? 20 : 8,
                          decoration: BoxDecoration(
                            color: onbordingController.currentIndex.value == index ? const Color(0xFFFFFFFF) : const Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                  ),
                ),

                // Right: Next or Get Started
                Obx(() => InkWell(
                      onTap: onbordingController.next,
                      child: AnimatedContainer(
                        duration: 300.milliseconds,
                        padding: EdgeInsets.symmetric(
                          horizontal: onbordingController.isLastPage ? 20 : 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF060C8D),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: onbordingController.isLastPage
                            ? const Text(
                                "Get Started",
                                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            : const Icon(Icons.chevron_right, color: Colors.white, size: 20),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to decide which animation to apply
  Widget _buildFloatingPerson(int index) {
    if (index == 0) {
      return const FloatingPerson(
        imagePath: 'asserts/images/onbording first person.png',
        
          movement: Offset(15, -15),
        index: '0'
      );
    } else if (index == 1) {
      return const FloatingPerson(
        imagePath: 'asserts/images/onbording secound person.png',
      movement: Offset(0, -15),
        index: '1'
      );
    } else {
      return const FloatingPerson(
        imagePath: 'asserts/images/onbording third person.png',
        movement: Offset(20, 0), // Horizontal Slide
        index: '2'
      );
    }
  }
}

// --- Floating Animation Helper Widget ---
class FloatingPerson extends StatefulWidget {
  final String imagePath;
  final Offset movement;
  final String index;

  const FloatingPerson({required this.imagePath, required this.movement, required this.index, super.key});

  @override
  State<FloatingPerson> createState() => _FloatingPersonState();
}

class _FloatingPersonState extends State<FloatingPerson> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // Adjust speed here
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: widget.movement,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine, // Makes the movement smooth and organic
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: _animation.value,
          child: child,
        );
      },
      child: widget.index == '0' ? Image.asset(widget.imagePath, width: MediaQuery.of(context).size.width ) : widget.index == '1' ? Image.asset(widget.imagePath, width: MediaQuery.of(context).size.width * 0.6) : Image.asset(widget.imagePath, width: MediaQuery.of(context).size.width * 0.8),
    );
  }
}
