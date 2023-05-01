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

  Future<void> session_check() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    print(isLoggedIn);
    if (isLoggedIn) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  Future<void> login(username, password) async {
    try {
      TokenModel settoken = TokenModel();

      final headers = <String, String>{
        'Content-Type': 'application/json',
      };
      final body = jsonEncode(<String, String>{
        'email': "kelompok6@gmail.com",
        'password': "kelompok6@gmail.com"
      });

      final response = await apiService.datapost("auth/login", headers, body);

      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        settoken.setToken(responseBody['access_token']);
        Get.offAllNamed(Routes.HOME);
      } else if (response.statusCode == 401) {
        throw Exception('Email atau password salah!');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void logout() {
    // lakukan proses logout
    // set _isAuthenticated ke false

    // navigasikan ke halaman login setelah logout
    Get.offAllNamed('auth/login');
  }
}
