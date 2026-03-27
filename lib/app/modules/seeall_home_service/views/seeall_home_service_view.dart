import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/seeall_home_service_controller.dart';

class SeeallHomeServiceView extends GetView<SeeallHomeServiceController> {
  const SeeallHomeServiceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SeeallHomeServiceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SeeallHomeServiceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
