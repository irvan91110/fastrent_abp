import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TokenModel extends GetxController {
  final RxString _token = ''.obs;

  String get token => _token.value;

  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Token', token);

    await prefs.setBool('isLoggedIn', true);

    print("set token berhasil!");
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('Token') ?? '';
    return token;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
