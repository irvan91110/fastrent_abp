import 'package:fastrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:fastrent/app/data/utils/app_text_style.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () {
          Get.toNamed(Routes.AUTH_LOGIN);
        },
        child: Text("My Button"),
      ),
    );
  }
}
