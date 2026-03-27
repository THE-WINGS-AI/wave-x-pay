import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; 

class HistoryController extends GetxController {
  var selectedTab = 0.obs;
  var totalTransactions = 66.obs;
var selectedRange = DateTimeRange(
    start: DateTime(DateTime.now().year, DateTime.now().month, 1),
    end: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
  ).obs;

  // Formatter for "1 July - 31 July 2025"
  String get dateRangeText {
    final start = DateFormat('d MMMM').format(selectedRange.value.start);
    final end = DateFormat('d MMMM yyyy').format(selectedRange.value.end);
    return "$start - $end";
  }

  Future<void> pickDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: selectedRange.value,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange, // Match your app theme
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedRange.value = picked;
    }
  }
  final List<Map<String, dynamic>> categories = [
    {"name": "Groceries", "count": 18, "amount": "- ₹3,410.49", "percent": "41%", "icon": "history apple icon.png"},
    {"name": "Car", "count": 12, "amount": "- ₹1,580.47", "percent": "19%", "icon": "history car icon.png"},
    {"name": "Investments", "count": 2, "amount": "- ₹831.82", "percent": "10%", "icon": "history investment icon.png"},
    {"name": "Restaurants", "count": 6, "amount": "- ₹665.46", "percent": "8%", "icon": "history restaurants icon.png"},
    {"name": "Travels", "count": 3, "amount": "- ₹582.27", "percent": "7%", "icon": "history travel icon.png"},
  ];

  final List<Map<String, dynamic>> chartData = [
    {'name': 'Groceries', 'value': 25.0, 'color': const Color(0xFFD05759)},
    {'name': 'Car', 'value': 25.0, 'color': const Color(0xFF0B8FD9)},
    {'name': 'Investments', 'value': 20.0, 'color': const Color(0xFFFD8744)},
    {'name': 'Travels', 'value': 15.0, 'color': const Color(0xFFFFB95A)},
    {'name': 'Transport', 'value': 15.0, 'color': const Color(0xFF82B572)},
  ];

  double getTotal() => chartData.fold(0, (sum, item) => sum + item['value']);
  var selectedIndex = 0.obs;

 

  
  void selectSegment(int index) {
    selectedIndex.value = index;
  }
}
