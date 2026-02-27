import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';
import 'package:xtpay/app/widgets/white_button.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  final WelcomeController welcomeController = WelcomeController();
  WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Image.asset(
                  'asserts/images/auth main hero image.png',
                  width: MediaQuery.of(context).size.width,
                ),
                
                const SizedBox(height: 30),
            
                // Hero Text
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "Unique ",
                        style: TextStyle(color: Color(0xFF000000)),
                      ),
                      TextSpan(
                        text: "Smart Routing",
                        style: TextStyle(color: Color(0xFFFF5D00)),
                      ),
                      TextSpan(
                        text: "\nPayment Gateway",
                        style: TextStyle(color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                ),
            
            SizedBox(height: 50,),
             OrangeButton(
              label:  "Sign up",
             onTap: () => welcomeController.navigateToSignUp(),
             horizontalPadding: 30,
            ),
               
                const SizedBox(height: 48),
            
WhiteButton(
  label: "Sign In",
  onTap: () => welcomeController.navigateToSignIn(),
  horizontalPadding: 30,
),
           
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
