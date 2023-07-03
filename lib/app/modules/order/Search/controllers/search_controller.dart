import 'dart:convert';

import 'package:get/get.dart';
import 'package:fastrent/app/data/providers/Network_provider.dart';

class SearchControllerx extends GetxController {
  final Networkprovider apiService = Get.put(Networkprovider());

  var asdasd = ''.obs;
  dynamic paymentMethod = [].obs;
  var sd = Get.arguments['sd'];
  var ed = Get.arguments['ed'];
  var seat = Get.arguments['seat'];
  var transmisi = Get.arguments['transmisi'];

  @override
  void onInit() async {
    paymentMethod.value = jsonDecode(jsonEncode(await apiService.dataget(
        'search?sd=$sd&ed=$ed&seat=$seat&transmisi=$transmisi',
        <String, String>{'Accept': 'application/json'})));

    super.onInit();
  }
}
