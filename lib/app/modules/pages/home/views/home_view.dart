import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:fastrent/app/modules/pages/history/views/history_view.dart';
import '../controllers/home_controller.dart';

import 'package:fastrent/app/data/utils/app_text_style.dart';
import 'package:fastrent/app/data/utils/app_colors.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fastrent',
          style: AppTextStyles.topnavbar,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Home view is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
