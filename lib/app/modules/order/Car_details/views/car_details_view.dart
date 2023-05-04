import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/car_details_controller.dart';

class CarDetailsView extends GetView<CarDetailsController> {
  const CarDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CarDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CarDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
