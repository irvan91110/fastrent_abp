import 'package:fastrent/app/data/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/checkout_controller.dart';

class MyDialog {
  final CheckoutController controller = Get.put(CheckoutController());

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  void openFullScreenDialog(value) {
    Get.dialog(
      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Data Penyewa'),
              GestureDetector(
                  onTap: () {
                    Get.back();
                    controller.selectedGender.value = 'me';
                  },
                  child: const Icon(Icons.close)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your Phone Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                  onPressed: () {
                    controller.updateSelected(value);
                    controller.updateInformation(
                        name.text, email.text, phone.text);
                    Get.back();
                  },
                  child: Text("Save"))
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
