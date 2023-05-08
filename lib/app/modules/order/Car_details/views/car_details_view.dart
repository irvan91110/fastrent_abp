import 'dart:convert';

import 'package:fastrent/app/data/utils/app_colors.dart';
import 'package:fastrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:carousel_animations/carousel_animations.dart';

import '../controllers/car_details_controller.dart';

class CarDetailsView extends GetView<CarDetailsController> {
  const CarDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Rcolors.background,
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: kElevationToShadow[1],
        ),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Wrap(
              children: controller.product.map<Widget>((details) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "biaya rental ${controller.daysTotal.toString()} hari"),
                          Text(
                            "Rp ${(details.price! * controller.daysTotal.value)}",
                            style: const TextStyle(color: Rcolors.primary),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Rcolors.primaryVariant,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.CHECKOUT);
                            },
                            child: const Text(
                              'continue',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: const BackButton(),
        title: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Fastrent'),
                Text(
                  '${controller.edFormat} - ${controller.sdFormat}',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: controller.product.map<Widget>((details) {
              return Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          details.images.isEmpty
                              ? "https://ci.catcar.info/opel_2015_05/data/NO_IMAGE12.jpg"
                              : details.images[index]['img_url'],
                          fit: BoxFit.fill,
                          repeat: ImageRepeat.noRepeat,
                        );
                      },
                      itemCount:
                          details.images.isEmpty ? 1 : details.images.length,
                      viewportFraction: 0.8,
                      scale: 0.9,
                      pagination: const SwiperPagination(
                        margin: EdgeInsets.zero,
                      ),
                      control: const SwiperControl(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                details.name!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.electric_car,
                                    color: Colors.blue,
                                  ),
                                  Text(details.transmisi == 0
                                      ? " manual"
                                      : " matic"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.airline_seat_recline_normal,
                                    color: Colors.blue,
                                  ),
                                  Text('${details.kapasitasmobil} Penumpang'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Rental Includes',
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Icon(
                                      Icons.schedule,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                        'Daily usage is 12 hours, or up to 23:59 if rental starts after 12:00'),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Icon(
                                      Icons.home_repair_service,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                        'montir jika penggunaan dalam kota'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Rental Excludes',
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.local_gas_station,
                                    color: Colors.blue,
                                  ),
                                  Text(' Fuel'),
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.more_time,
                                    color: Colors.blue,
                                  ),
                                  Text(' Overtime'),
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.payments,
                                    color: Colors.blue,
                                  ),
                                  Text(' Tips (optional)'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
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
