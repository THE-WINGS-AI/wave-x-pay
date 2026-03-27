import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtpay/app/modules/home/views/home_view.dart';
import 'package:xtpay/app/modules/onbording/views/onbording_view.dart';
import 'package:xtpay/app/widgets/fontsize.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final SplashController splashController = Get.put(SplashController());
   SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00068B),
      body: FutureBuilder<bool>(
        future: splashController.startTimer(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
right: 0,                  child: Image.asset(
                    'asserts/images/upper blur image.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.contain,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'asserts/images/bottom blur image.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.contain,
                  ),
                ),

                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'asserts/images/splash logo.png',
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Unique Smart Routing Payment Gateway",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError || snapshot.data == false) {
            return  OnbordingView();
          } else {
            return  HomeView();
          }
        },
      ),
    );
  }
}