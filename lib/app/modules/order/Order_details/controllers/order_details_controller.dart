import 'package:get/get.dart';
import '../../../../data/providers/Network_provider.dart';

class OrderDetailsController extends GetxController {
  // var ed = Get.arguments['reference'];
  var ed = "DEV-T1774290579MDLQZ";
  var payment_method = {}.obs;
  var data_booking = {}.obs;
  var data_mobil = {}.obs;
  var pembeli = {}.obs;
  var daysTotal = 0.obs;
  final Networkprovider apiService = Get.put(Networkprovider());
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODM2MTUxMTIsImV4cCI6NTQ2NzkzNTExMiwibmJmIjoxNjgzNjE1MTEyLCJqdGkiOiJQZHhBYjBsNndwTkdKemtuIiwic3ViIjoiNSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.xSaUD8ybbOmhVVF1M4Qm5lsR9RdFeHme1EAW7x3WWC0";

  @override
  void onInit() async {
    var dataku = (await apiService.dataget('transaction/$ed', <String, String>{
      'Accept': 'application/json',
      "authorization": "Bearer $token"
    }));
    payment_method.value = dataku['payment_method']['data'];
    data_booking.value = dataku['data_booking'];
    data_mobil.value = dataku['data_mobil'];
    pembeli.value = dataku['pembeli'];

    DateTime startDate = DateTime.parse(data_booking['tanggal_booking']);
    DateTime endDate = DateTime.parse(data_booking['tanggal_kembali']);
    daysTotal.value = (endDate.difference(startDate).inDays + 1);
    super.onInit();
  }
}
