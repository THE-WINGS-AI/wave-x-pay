import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String label;
  final double horizontalPadding;
  final VoidCallback onTap;
  final double height;
  final double borderRadius;
  final List<Color> gradientColors;

  const OrangeButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.horizontalPadding = 30.0,
    this.height = 55,
    this.borderRadius = 25,
    this.gradientColors = const [
      Color(0x85FF5D00),
      Color(0xFFFF5D00),
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF060C8D).withOpacity(0.24),
              offset: const Offset(0, 20),
              blurRadius: 40,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}