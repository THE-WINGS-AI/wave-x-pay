import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final String label;
  final double horizontalPadding;
  final VoidCallback onTap;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;

  const WhiteButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.horizontalPadding = 30.0,
    this.height = 60,
    this.borderRadius = 15,
    this.backgroundColor = const Color(0xFFF2F4FA),
    this.textColor = const Color(0xFFFF5D00),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}