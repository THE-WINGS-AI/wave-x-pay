import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mpin_enter_controller.dart';

class MpinEnterView extends GetView<MpinEnterController> {
  const MpinEnterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MpinEnterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MpinEnterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
