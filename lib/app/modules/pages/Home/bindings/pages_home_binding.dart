import 'package:get/get.dart';

import '../controllers/pages_home_controller.dart';

class PagesHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PagesHomeController());
  }
}
