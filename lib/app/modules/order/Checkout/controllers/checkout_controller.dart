import 'dart:convert';

import 'package:get/get.dart';
import 'package:fastrent/app/data/providers/Network_provider.dart';

class CheckoutController extends GetxController {
  final Networkprovider apiService = Get.put(Networkprovider());

  var selectedGender = 'me'.obs;
  var fullName = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var selectedPayment = ''.obs;
  var paymentMethod = [].obs;
  @override
  void onInit() async {
    paymentMethod.value = jsonDecode(jsonEncode(await apiService.dataget(
        'paymethod',
        <String, String>{'Accept': 'application/json'})))['payment_method'];

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
  }

  void updateSelectedGender(String value) async {
    if (value == 'me') {
      UpdateInformation(
          "IRVAN ARDIANSYAH", "irvan9110@gmail.com", "85156540536");
    }
    selectedGender.value = value;
  }

  void sentData() {
    print(fullName.value);
    print(email.value);
    print(phone.value);
    print(selectedPayment.value);
  }

  void updateSelectedPayment(String value) {
    selectedPayment.value = value;
  }
}
