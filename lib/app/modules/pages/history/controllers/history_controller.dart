import 'dart:convert';

import 'package:fastrent/app/data/model/token_model.dart';
import 'package:get/get.dart';

import 'package:fastrent/app/data/providers/Network_provider.dart';

class HistoryController extends GetxController {
  final Networkprovider apiService = Get.put(Networkprovider());
  var history = [].obs;

  var asd = "asd".obs;
  @override
  void onInit() async {
    TokenModel token = TokenModel();
    history.value = jsonDecode(
        jsonEncode(await apiService.dataget('transaction', <String, String>{
      'Accept': 'application/json',
      'authorization': 'Bearer ${await token.getToken()}'
    })))['Transaction'];

    super.onInit();
  }
}
