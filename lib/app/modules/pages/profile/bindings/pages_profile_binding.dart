import 'package:get/get.dart';

import '../controllers/pages_profile_controller.dart';

class PagesProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagesProfileController>(
      () => PagesProfileController(),
    );
  }
}
