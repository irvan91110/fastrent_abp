import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';
import 'package:fastrent/app/data/utils/app_text_style.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
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
      body: Column(
        children: [
          Text(
            'HistoryView is working',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
