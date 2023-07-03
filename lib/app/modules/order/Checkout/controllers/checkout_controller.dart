import 'dart:convert';

import 'package:fastrent/app/data/model/token_model.dart';
import 'package:fastrent/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:fastrent/app/data/providers/Network_provider.dart';
import 'package:fastrent/app/data/model/Productmodel.dart';
import 'package:intl/intl.dart';

class CheckoutController extends GetxController {
  final Networkprovider apiService = Get.put(Networkprovider());

  var selectedGender = 'me'.obs;
  var selectedPayment = ''.obs;
  var paymentMethod = [].obs;
  var user = {}.obs;
  var userx = {};
  var cardList = <ProductModel>[].obs;
  /////////////////////////////////////////////////
  var id = Get.arguments['id'];
  var sd = Get.arguments['sd'];
  var ed = Get.arguments['ed'];
  var daysTotal = Get.arguments['Total'];

  var sdFormat = ''.obs;
  var edFormat = ''.obs;

  @override
  void onInit() async {
    TokenModel token = TokenModel();

    DateTime startDate = DateTime.parse(sd);
    DateTime endDate = DateTime.parse(ed);
    sdFormat.value = DateFormat.yMMMEd().format(startDate).toString();
    edFormat.value = DateFormat.yMMMEd().format(endDate).toString();

    //payment method
    paymentMethod.value = jsonDecode(jsonEncode(await apiService.dataget(
        'paymethod',
        <String, String>{'Accept': 'application/json'})))['payment_method'];
    //get user
    userx = await apiService.dataget('auth/get_user', <String, String>{
      'Accept': 'application/json',
      'authorization': 'Bearer ${await token.getToken()}'
    });
    //get car details

    List<dynamic> myMap = (await apiService.dataget('$id/details?sd=$sd&ed=$ed',
        <String, String>{'Accept': 'application/json'}));

    cardList.value = myMap
        .toList()
        .map((product) => ProductModel.fromJson(product))
        .toList();

    if (selectedGender.value == "me") {
      updateInformation(userx['name'], userx['email'], userx['phone']);
    }
    super.onInit();
  }

  void updateInformation(String name, String Email, String Phone) {
    user['name'] = name;
    user['email'] = Email;
    user['phone'] = Phone;
  }

  void updateSelected(String value) async {
    if (value == 'me') {
      updateInformation(userx['name'], userx['email'], userx['phone']);
    }
    selectedGender.value = value;
  }

  void updateSelectedPayment(String value) {
    selectedPayment.value = value;
  }

  //getter
  void sentData() async {
    TokenModel token = TokenModel();
    String fullName = user['name'];

    var names = fullName.split(' ');

    var submit = await apiService
        .datapost('${id.toString()}/post_checkout', <String, String>{
      'Accept': 'application/json',
      'authorization': 'Bearer ${await token.getToken()}'
    }, <String, String>{
      'start_date': sd.toString(),
      'end_date': ed.toString(),
      'phone': user['phone'].toString(),
      'payment': selectedPayment.value,
      'first_name': names[0],
      'last_name': names[1],
      'version': "mobile",
    });
    print(submit.statusCode);
    if (submit.statusCode == 200) {
      Get.offAllNamed(Routes.ORDER_DETAILS, arguments: {
        "reference": jsonDecode(submit.body)['Data_pembayaran']['reference'],
      });
    } else if (submit.statusCode == 409) {
      Get.offAllNamed(Routes.ORDER_DETAILS, arguments: {
        "reference": jsonDecode(submit.body)['status_pembayaran']['reference'],
      });
    }
  }
}
