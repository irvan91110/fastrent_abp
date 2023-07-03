import 'package:fastrent/app/data/utils/app_colors.dart';
import 'package:fastrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:fastrent/app/data/model/token_model.dart';
import 'package:http/http.dart';
import '../controllers/pages_profile_controller.dart';

import 'package:fastrent/app/data/utils/app_text_style.dart';

class PagesProfileView extends GetView<PagesProfileController> {
  const PagesProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PagesProfileController());

    TokenModel token = TokenModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: AppTextStyles.topnavbar,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nama',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.response['name'].toString(),
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Divider(
                            height: 5,
                            thickness: 1,
                            color: Color(0xff6F6F6F),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.response['email'].toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          const Divider(
                            height: 5,
                            thickness: 1,
                            color: Color(0xff6F6F6F),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nomor Handphone',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "+62 ${controller.response['phone']}",
                                style: TextStyle(fontSize: 15),
                              ),
                              const Text(
                                'Ubah',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Rcolors.primary),
                              ),
                            ],
                          ),
                          const Divider(
                            height: 5,
                            thickness: 1,
                            color: Color(0xff6F6F6F),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kata Sandi',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '*******************',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'Ubah',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Rcolors.primary),
                              ),
                            ],
                          ),
                          const Divider(
                            height: 5,
                            thickness: 1,
                            color: Color(0xff6F6F6F),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Rcolors.primaryVariant,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                      onPressed: () async {
                        print("data berhasil disimpan");
                      },
                      child: Text(
                        "Simpan",
                        style: TextStyle(color: Rcolors.onPrimary),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Rcolors.error,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                      onPressed: () async {
                        token.logout();
                        Get.toNamed(Routes.AUTH_LOGIN);
                      },
                      child: Text(
                        "Keluar",
                        style: TextStyle(color: Rcolors.onPrimary),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
