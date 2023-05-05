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
    List<String> images = [
      'https://w7.pngwing.com/pngs/81/530/png-transparent-car-honda-brio-honda-city-honda-mobilio-rs-car-compact-car-car-vehicle.png',
      'https://www.pngitem.com/pimgs/m/274-2741878_mobil-toyota-innova-png-transparent-png.png',
    ];
    return Scaffold(
      backgroundColor: Rcolors.background,
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:
              kElevationToShadow[1], // Use This kElevationToShadow ***********
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("biaya rental 13 hari"),
                  Text(
                    "Rp 500.000",
                    style: TextStyle(color: Rcolors.primary),
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
                      Get.offAndToNamed(Routes.CHECKOUT);
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
        ),
      ),
      appBar: AppBar(
        leading: const BackButton(),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Fastrent'),
            Text(
              '1 june 2023 - 4 june 2023',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  final image = images[index];
                  return Image.network(
                    image,
                    fit: BoxFit.fill,
                  );
                },
                itemCount: images.length,
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
                        const Text(
                          'Avanza',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.electric_car,
                              color: Colors.blue,
                            ),
                            Text(' Manual'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.airline_seat_recline_normal,
                              color: Colors.blue,
                            ),
                            Text('8 Penumpang'),
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
                              child: Text('montir jika penggunaan dalam kota'),
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
        ),
      ),
    );
  }
}
