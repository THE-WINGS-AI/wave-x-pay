import 'package:flutter/material.dart';

class StatusDialog extends StatelessWidget {
  final bool isSuccess;
  const StatusDialog({super.key, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), // Rounded top corners
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Aligns to bottom content
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
            isSuccess ? "Congratulations!" : "Oops!",
            style: const TextStyle(
              fontSize: 20, // Requested size
              fontWeight: FontWeight.bold,
              color: Color(0xFF323232), // Requested color
            ),
          ),
          const SizedBox(height: 12),
          
          // Description
          Text(
            isSuccess 
                ? "Verification is complete\nYou can create your mPIN" 
                : "Verification failed\nPlease try again.",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16, // Requested size
              color: Color(0xFF4F4F4F), // Requested color
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}