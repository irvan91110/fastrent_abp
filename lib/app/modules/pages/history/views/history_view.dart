import 'package:fastrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';
import 'package:fastrent/app/data/utils/app_text_style.dart';

import '../views/card_widget.dart';

class HistoryView extends GetView<HistoryController> {
  HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat sewa',
          style: AppTextStyles.topnavbar,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: controller.history.map<Widget>((list) {
              return Column(
                children: [
                  CustomCardWidget(
                    bookid:
                        list['data_pembayaran']['data_booking_id'].toString(),
                    start: list['tanggal_booking'],
                    end: list['tanggal_kembali'],
                    status: list['data_pembayaran']['status'],
                    price: list['total_harga'].toString(),
                    onChanged: () {
                      Get.offAndToNamed(Routes.ORDER_DETAILS, arguments: {
                        'reference': list['data_pembayaran']['reference']
                      });
                    },
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
