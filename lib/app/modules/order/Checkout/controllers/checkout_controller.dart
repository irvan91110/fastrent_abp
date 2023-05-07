import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  var selectedGender = 'me'.obs;

  var fullName = ''.obs;

  var email = ''.obs;

  var phone = ''.obs;
  var selectedPayment = ''.obs;
  @override
  void onInit() async {
    if (selectedGender.value == "me") {
      UpdateInformation(
          "IRVAN ARDIANSYAH", "irvan9110@gmail.com", "85156540536");
    }
    super.onInit();
  }

  void UpdateInformation(String name, String Email, String Phone) {
    fullName.value = name;
    email.value = Email;
    phone.value = Phone;
    print("Berhasil");
  }

  void updateSelectedGender(String value) {
    if (value == 'me') {
      UpdateInformation(
          "IRVAN ARDIANSYAH", "irvan9110@gmail.com", "85156540536");
    }
    selectedGender.value = value;
  }

  void updateSelectedPayment(String value) {
    selectedPayment.value = value;

    print(selectedPayment.value);
  }
}
