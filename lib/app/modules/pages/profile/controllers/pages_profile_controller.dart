import 'dart:convert';

import 'package:fastrent/app/data/model/token_model.dart';
import 'package:fastrent/app/data/providers/Network_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PagesProfileController extends GetxController {
  final Networkprovider apiService = Get.put(Networkprovider());
  var response = {}.obs;
  @override
  void onInit() async {
    TokenModel token = TokenModel();

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await token.getToken()}'
    };

    response.value = await apiService.dataget("auth/get_user", headers);

    super.onInit();
  }
}
