import 'dart:convert';

import 'package:get/get.dart';
import 'package:fastrent/app/data/providers/Network_provider.dart';
import 'package:fastrent/app/data/model/Productmodel.dart';
import 'package:intl/intl.dart';

class CarDetailsController extends GetxController {
  final Networkprovider apiService = Get.put(Networkprovider());
  var images = [].obs;
  var id = Get.arguments['id'];
  var sd = Get.arguments['sd'];
  var ed = Get.arguments['ed'];

  var sdFormat = ''.obs;
  var edFormat = ''.obs;
  var product = <ProductModel>[].obs;

  var daysTotal = 0.obs;

  @override
  void onInit() async {
    DateTime startDate = DateTime.parse(sd);
    DateTime endDate = DateTime.parse(ed);
    sdFormat.value = DateFormat.yMMMEd().format(startDate).toString();
    edFormat.value = DateFormat.yMMMEd().format(endDate).toString();

    daysTotal.value = (endDate.difference(startDate).inDays + 1);
    List<dynamic> myMap = await apiService.dataget('$id/details?sd=$sd&ed=$ed',
        <String, String>{'Accept': 'application/json'});

    product.value = myMap
        .toList()
        .map((product) => ProductModel.fromJson(product))
        .toList();

    super.onInit();
  }
}
