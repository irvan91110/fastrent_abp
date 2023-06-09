import 'package:fastrent/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:fastrent/app/data/providers/Network_provider.dart';
import 'dart:convert';

import 'package:fastrent/app/data/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLoginController extends GetxController {
  final Networkprovider apiService = Get.put(Networkprovider());
  SharedPreferences? _prefs;
  var isLogged = false.obs;
  var errorCode = "".obs;
  Future<void> session_check() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    print(isLoggedIn);
    if (isLoggedIn) {
      Get.offAllNamed(Routes.PAGES_DASHBOARD);
    }
  }

  Future<void> login(username, password) async {
    try {
      TokenModel settoken = TokenModel();

      final headers = <String, String>{
        'Content-Type': 'application/json',
      };
      final body =
          jsonEncode(<String, String>{'email': username, 'password': password});

      final response = await apiService.datapost("auth/login", headers, body);

      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        settoken.setToken(responseBody['access_token']);
        Get.offAllNamed(Routes.PAGES_DASHBOARD);
      } else if (response.statusCode == 401) {
        throw Exception('Email atau password salah!');
      } else {
        throw Exception('masukan format email dan password yang benar!');
      }
    } catch (e) {
      errorCode.value = e.toString().replaceAll('Exception: ', '');
    }
  }
}
