import 'package:get/get.dart';

class NetworkProvider extends GetConnect {
  void onInit() {
    httpClient.baseUrl = 'https://localhost/api';
    super.onInit();
  }

  Future<dynamic> getUser() async {}
}
