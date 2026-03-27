// import 'dart:math';
// import 'package:flutter/material.dart';

// class DonutChartPainter extends CustomPainter {
//   final List<Map<String, dynamic>> data;
//   final double total;
//   final int selectedIndex;

//   DonutChartPainter(this.data, this.total, this.selectedIndex);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = min(size.width, size.height) / 2;
//     final thickness = radius * 0.55; // Thickness of the donut ring

//     double startAngle = -pi / 2; // Start from top

//     for (var item in data) {
//       final sweepAngle = (item['value'] / total) * 2 * pi;
//       final paint = Paint()
//         ..color = item['color']
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = thickness
//         ..strokeCap = StrokeCap.butt;

//       // Draw Shadow for each segment
//       final shadowPaint = Paint()
//         ..color = Colors.black.withOpacity(0.25)
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = thickness
//         ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius - thickness / 2),
//         startAngle,
//         sweepAngle,
//         false,
//         shadowPaint,
//       );

//       // Draw Main Segment
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius - thickness / 2),
//         startAngle,
//         sweepAngle,
//         false,
//         paint,
//       );

//       // Draw White Border (Center Aligned)
//       final borderPaint = Paint()
//         ..color = Colors.white
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 6.85
//         ..strokeCap = StrokeCap.butt;

//       // Draw radial lines at the start and end of segments to create the border gap
//       double lineLength = thickness;
//       Offset innerPoint = Offset(
//         center.dx + (radius - lineLength) * cos(startAngle),
//         center.dy + (radius - lineLength) * sin(startAngle),
//       );
//       Offset outerPoint = Offset(
//         center.dx + radius * cos(startAngle),
//         center.dy + radius * sin(startAngle),
//       );
//       canvas.drawLine(innerPoint, outerPoint, borderPaint);

//       startAngle += sweepAngle;
//     }

//     // Draw Inner and Outer White Circles for "Center Aligned" Border look
//     final circleBorderPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 6.85;

//     canvas.drawCircle(center, radius, circleBorderPaint);
//     canvas.drawCircle(center, radius - thickness, circleBorderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

import 'dart:math';
import 'package:flutter/material.dart';

class DonutChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;
  final double total;
  final int selectedIndex;

  DonutChartPainter(this.data, this.total, this.selectedIndex);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    final thickness = radius * 0.55;

    double startAngle = -pi / 2;

    for (int i = 0; i < data.length; i++) {
      final item = data[i];
      final sweepAngle = (item['value'] / total) * 2 * pi;
      final isSelected = i == selectedIndex;

      // Base Paint for the segment
      final paint = Paint()
        ..color = item['color']
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness
        ..strokeCap = StrokeCap.butt;

      // 1. DRAW SHADOW (Only if selected)
      if (isSelected) {
        final shadowPaint = Paint()
          ..color = Colors.black.withOpacity(0.3)
          ..style = PaintingStyle.stroke
          ..strokeWidth = thickness + 2 // Slightly wider for better shadow spread
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius - thickness / 2),
          startAngle,
          sweepAngle,
          false,
          shadowPaint,
        );
      }

      // 2. DRAW MAIN SEGMENT
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - thickness / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      // 3. DRAW BORDERS (Only if selected)
      if (isSelected) {
        final borderPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.0 // Thinner, cleaner border
          ..strokeCap = StrokeCap.butt;

        // Path for the segment borders (Inner arc, Outer arc, and side lines)
        final double innerRadius = radius - thickness;
        final double outerRadius = radius;

        Path path = Path();
        
        // Move to start of outer arc
        path.addArc(
          Rect.fromCircle(center: center, radius: outerRadius),
          startAngle,
          sweepAngle,
        );
        
        // Add inner arc (drawn in reverse to create a closed loop if needed)
        path.addArc(
          Rect.fromCircle(center: center, radius: innerRadius),
          startAngle + sweepAngle,
          -sweepAngle,
        );

        // Draw radial lines to close the "slice" look
        canvas.drawLine(
          Offset(center.dx + innerRadius * cos(startAngle), center.dy + innerRadius * sin(startAngle)),
          Offset(center.dx + outerRadius * cos(startAngle), center.dy + outerRadius * sin(startAngle)),
          borderPaint,
        );
        canvas.drawLine(
          Offset(center.dx + innerRadius * cos(startAngle + sweepAngle), center.dy + innerRadius * sin(startAngle + sweepAngle)),
          Offset(center.dx + outerRadius * cos(startAngle + sweepAngle), center.dy + outerRadius * sin(startAngle + sweepAngle)),
          borderPaint,
        );

        // Draw the concentric borders
        canvas.drawArc(Rect.fromCircle(center: center, radius: outerRadius), startAngle, sweepAngle, false, borderPaint);
        canvas.drawArc(Rect.fromCircle(center: center, radius: innerRadius), startAngle, sweepAngle, false, borderPaint);
      }

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant DonutChartPainter oldDelegate) =>
      oldDelegate.selectedIndex != selectedIndex || oldDelegate.data != data;
}