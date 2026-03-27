import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/datacable_controller.dart';

class DatacableView extends GetView<DatacableController> {
  const DatacableView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DatacableView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DatacableView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
