import 'package:fastrent/app/data/model/token_model.dart';
import 'package:get/get.dart';
import '../../../../data/providers/Network_provider.dart';

class OrderDetailsController extends GetxController {
  var ed = Get.arguments['reference'];

  var payment_method = {}.obs;
  var data_booking = {}.obs;
  var data_mobil = {}.obs;
  var pembeli = {}.obs;
  var daysTotal = 0.obs;
  final Networkprovider apiService = Get.put(Networkprovider());

  @override
  void onInit() async {
    TokenModel token = TokenModel();

    var dataku = (await apiService.dataget('transaction/$ed', <String, String>{
      'Accept': 'application/json',
      'authorization': 'Bearer ${await token.getToken()}'
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
