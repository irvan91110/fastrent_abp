import 'package:fastrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomCardWidget extends StatelessWidget {
  final String Nama_mobil;
  final String transmisi;
  final int seat;
  final String imageUrl;

  CustomCardWidget({
    required this.Nama_mobil,
    required this.transmisi,
    required this.seat,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15),
                    child: Text(Nama_mobil),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Image.network(
                          imageUrl,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Wrap(
                          children: [
                            Container(width: 10, color: Colors.transparent),
                            Icon(
                              Icons.airline_seat_recline_normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            Text("${seat} orang"),
                            Container(width: 5, color: Colors.transparent),
                            Icon(
                              Icons.electric_car,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            Container(width: 5, color: Colors.transparent),
                            Text(transmisi),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0, bottom: 5),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("From"),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0, bottom: 3.0),
                              child: Text(
                                "Rp 239.000/day",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          Get.toNamed(Routes.CAR_DETAILS);
        });
  }
}
