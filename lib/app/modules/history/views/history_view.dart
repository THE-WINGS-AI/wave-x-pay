import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xtpay/app/widgets/donut_chart_painter.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  final HistoryController historyController = Get.put(HistoryController());
  HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // grayscale-50
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text("Transactions", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 25),
            _buildSummaryCard(),
            const SizedBox(height: 30),
            // _donutChart(context),
            // const SizedBox(height: 30),
            _buildTabSwitcher(),
            const SizedBox(height: 20),
            _buildCategoryList(),
          ],
        ),
      ),
    );
  }

Widget _buildHeader() {

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Transactions",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          // Wrap in Obx to listen for date changes
          Obx(() => Text(
                historyController.dateRangeText,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              )),
        ],
      ),
      GestureDetector(
        onTap: () => historyController.pickDateRange(Get.context!),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0x1A101010), width: 0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Image.asset(
            'asserts/images/history calendar icon.png',
            width: 24,
          ),
        ),
      ),
    ],
  );
}
  // Widget _buildHeader() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       const Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text("Transactions", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
  //           Text("1 July - 31 July 2025", style: TextStyle(color: Colors.grey, fontSize: 14)),
  //         ],
  //       ),
  //       Container(
  //         padding: const EdgeInsets.all(10),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           shape: BoxShape.circle,
  //           border: Border.all(color: const Color(0x1A101010), width: 0.5),
  //         ),
  //         child: Image.asset('asserts/images/history calendar icon.png', width: 24),
  //       ),
  //     ],
  //   );
  // }

  Widget _donutChart(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() => SizedBox(
              width: 250,
              height: 250,
              child: CustomPaint(
                  painter: DonutChartPainter(
                      historyController.chartData,
                      historyController.getTotal(),
                      historyController.selectedIndex.value)),
            )),
        const SizedBox(height: 30),
        // Interactive Legend
        Wrap(
          spacing: 15,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: List.generate(historyController.chartData.length, (index) {
            final item = historyController.chartData[index];
            return Obx(() {
              bool isSelected = historyController.selectedIndex.value == index;
              return GestureDetector(
                onTap: () => historyController.selectSegment(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.grey[100] : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? const Color(0xFFFF5D00).withOpacity(0.2) : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: item['color'],
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item['name'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? const Color(0xFF060C8D) : const Color(0xFF323232),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }),
        ),
      ],
    );
  }
  // Widget _donutChart(BuildContext context) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       SizedBox(
  //         width: 250,
  //         height: 250,
  //         child: CustomPaint(
  //           painter: DonutChartPainter(
  //             historyController.chartData,
  //             historyController.getTotal(),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 30),
  //       // Legend
  //       Wrap(
  //         spacing: 15,
  //         runSpacing: 10,
  //         alignment: WrapAlignment.center,
  //         children: historyController.chartData.map((item) {
  //           return Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Container(
  //                 width: 12,
  //                 height: 12,
  //                 decoration: BoxDecoration(
  //                   color: item['color'],
  //                   borderRadius: BorderRadius.circular(2),
  //                 ),
  //               ),
  //               const SizedBox(width: 5),
  //               Text(
  //                 item['name'],
  //                 style: const TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.w500,
  //                   color: Color(0xFF323232),
  //                 ),
  //               ),
  //             ],
  //           );
  //         }).toList(),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0x1A101010), width: 0.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [Color(0xFFFF5D00), Color(0xFFFF8C4B)]),
                    ),
                    child: Image.asset('asserts/images/history arrow-up-right.png', width: 20),
                  ),
                  const SizedBox(width: 15),
                  const Text("Expenses", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              const Text("- ₹8,318", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Text("🖖", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                Text(
                  "You have made ${historyController.totalTransactions} transactions in total",
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _summarySmallBox('history category icon.png', "Categories", "8"),
              const SizedBox(width: 15),
              _summarySmallBox('history hash icon.png', "Tags", "3"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summarySmallBox(String icon, String label, String count) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0x1A101010), width: 0.5),
        ),
        child: Row(
          children: [
            Image.asset('asserts/images/$icon', width: 20),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const Spacer(),
            Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSwitcher() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Obx(() => Row(
            children: [
              _tabButton("Categories", 0),
              _tabButton("Tags", 1),
            ],
          )),
    );
  }

  Widget _tabButton(String label, int index) {
    bool isSelected = historyController.selectedTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => historyController.selectedTab.value = index,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)] : [],
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? Colors.black : Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: historyController.categories.length,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        final item = historyController.categories[index];
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [Color(0xFF00068A), Color(0xFF1019E0)]),
              ),
              child: Image.asset('asserts/images/${item['icon']}', width: 24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("${item['count']} transactions", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(item['amount'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(item['percent'], style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        );
      },
    );
  }
}
