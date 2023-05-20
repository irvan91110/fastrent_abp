import 'dart:convert';

import 'package:get/get.dart';

import 'package:fastrent/app/data/providers/Network_provider.dart';

class HistoryController extends GetxController {
  final Networkprovider apiService = Get.put(Networkprovider());
  var history = [].obs;
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODM2MTUxMTIsImV4cCI6NTQ2NzkzNTExMiwibmJmIjoxNjgzNjE1MTEyLCJqdGkiOiJQZHhBYjBsNndwTkdKemtuIiwic3ViIjoiNSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.xSaUD8ybbOmhVVF1M4Qm5lsR9RdFeHme1EAW7x3WWC0";
  var asd = "asd".obs;
  @override
  void onInit() async {
    history.value = jsonDecode(jsonEncode(await apiService.dataget(
        'transaction', <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    })))['Transaction'];

    super.onInit();
  }
}
