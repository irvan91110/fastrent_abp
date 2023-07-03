import 'dart:convert';

import 'package:fastrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

import '../views/card_widget.dart';

class SearchView extends GetView<SearchControllerx> {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              for (int i = 0; i < controller.paymentMethod.length; i++)
                CustomCardWidget(
                    Nama_mobil: controller.paymentMethod[i]['nama_mobil'],
                    transmisi: controller.paymentMethod[i]['transmisi_mobil']
                                .toString() ==
                            "0"
                        ? "manual"
                        : "matic",
                    harga:
                        controller.paymentMethod[i]['harga_mobil'].toString(),
                    onChanged: () {
                      Get.toNamed(Routes.CAR_DETAILS, arguments: {
                        "id": controller.paymentMethod[i]['id'].toString(),
                        "sd": controller.sd,
                        "ed": controller.ed,
                      });
                    },
                    seat: controller.paymentMethod[i]['kapasitas_mobil']
                        .toString(),
                    imageUrl: controller.paymentMethod[i]['urls'].isEmpty
                        ? "https://ci.catcar.info/opel_2015_05/data/NO_IMAGE12.jpg"
                        : controller.paymentMethod[i]['urls'][0]['img_url']),
            ],
          ),
        ),
      ),
    );
  }
}
