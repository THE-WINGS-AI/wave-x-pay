
import 'package:flutter/material.dart';

class FaceDialog extends StatelessWidget {
  final bool isSuccess;
  final int currentAttempts;

  const FaceDialog({
    super.key, 
    required this.isSuccess, 
    this.currentAttempts = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), // Rounded top corners
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Aligns content to bottom
        children: [
          // Icon
          Image.asset(
            isSuccess 
                ? 'asserts/images/success logo for dialogbox.png' 
                : 'asserts/images/error logo for dialogbox.png',
            height: 100,
          ),
          const SizedBox(height: 24),
          
          // Title
          Text(
            isSuccess ? "Face Recognised" : "Face not recognized",
            style: const TextStyle(
              fontSize: 20, // Requested size
              fontWeight: FontWeight.bold,
              color: Color(0xFF323232), // Requested color
            ),
          ),
          const SizedBox(height: 10),
          
          // Subtitle for failure
          if (!isSuccess)
            Text(
              "$currentAttempts out of 3 attempts, Please try again.",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14, // Requested size
                color: Color(0xFF4F4F4F), // Requested color
              ),
            ),
            
          // Verification text for success
          // if (isSuccess && currentAttempts == 0) // used for OTP success
          //    const Text(
          //     "Verification is complete\nYou can create your mPIN",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(fontSize: 16, color: Color(0xFF4F4F4F)),
          //   ),

          const SizedBox(height: 30),

          // Success indicator button
          if (isSuccess)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4FA),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Face Recognised",
                style: TextStyle(
                  color: Color(0xFFFF5D00), // Requested color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}