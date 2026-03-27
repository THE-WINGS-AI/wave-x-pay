import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/utilities_controller.dart';

class UtilitiesView extends GetView<UtilitiesController> {
  const UtilitiesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UtilitiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UtilitiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
