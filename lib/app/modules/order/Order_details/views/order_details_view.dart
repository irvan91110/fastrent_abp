import 'package:fastrent/app/data/utils/app_colors.dart';
import 'package:fastrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/order_details_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => Get.offAllNamed(Routes.PAGES_DASHBOARD),
        ),
        title: Column(
          children: [
            const Text('Detail Pembayaran'),
            Text(
              controller.ed.toString(),
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "Detail Pembayaran",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Divider(
                            thickness: 2.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Metode Pembayaran"),
                              Text(controller.payment_method['payment_method']
                                  .toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Total Pembayaran"),
                              Text(controller.payment_method['amount']
                                  .toString()),
                            ],
                          ),
                        ),
                        if (controller.payment_method['status'] == 'UNPAID')
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Rcolors.primaryVariant,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: InkWell(
                                    child: const Text(
                                      'Bayar sekarang',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () => launchUrl(Uri.parse(controller
                                        .payment_method['checkout_url']))),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text("Detail Sewa Mobil"),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Row(
                            children: [
                              if (controller.payment_method['order_items'] !=
                                  null)
                                Flexible(
                                  child: Image.network(
                                    controller.payment_method['order_items'][0]
                                            ['image_url']
                                        .toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.data_mobil['nama_mobil']
                                        .toString()),
                                    Text(
                                        "${controller.data_mobil['kapasitas_mobil']} Kursi / Mobil"),
                                    Text(
                                        "Transmisi ${controller.data_mobil['transmisi_mobil'] == 0 ? "Manual" : "Matic"}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const Text("Tanggal Sewa"),
                                  Text(controller
                                      .data_booking['tanggal_booking']
                                      .toString()),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text("Tanggal Kembali"),
                                  Text(controller
                                      .data_booking['tanggal_kembali']
                                      .toString()),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Durasi"),
                                  Text("${controller.daysTotal.value} hari"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Wrap(
                            children: [
                              const Text("Lokasi Ambil"),
                              InkWell(
                                  child: const Text(
                                    'Jl. Raya Bojongsoang No.196b, Lengkong, Kec. Bojongsoang, Kabupaten Bandung, Jawa Barat 40287',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onTap: () => launchUrl(Uri.parse(
                                      "https://www.google.co.id/maps/place/Permata+Buah+Batu/@-6.9728922,107.6362692,17z/data=!3m1!4b1!4m5!3m4!1s0x2e68e9b3ccd961b7:0x1ec8ad28e2a2498d!8m2!3d-6.9728922!4d107.6384579?coh=164777&entry=tt&shorturl=1"))),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Wrap(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Detail Pemesan"),
                                  Text(controller
                                      .payment_method['customer_name']
                                      .toString()),
                                  Row(
                                    children: [
                                      const Text("Telepon : "),
                                      Text(controller
                                          .payment_method['customer_phone']
                                          .toString()),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                          child: Text("Baca Ketentuan Rental"),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("1. Membawa KTP/paspor"),
                              Text("2. SIM A/ SIM Internasional"),
                              Text("3. Deposit IDR 500.000"),
                              Text("4. Status/Pekerjaan"),
                              Text("5. Nama Akun Media Sosial"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
