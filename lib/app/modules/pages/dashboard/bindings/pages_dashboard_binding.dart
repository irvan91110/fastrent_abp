import 'package:get/get.dart';

import '../controllers/pages_dashboard_controller.dart';

class PagesDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagesDashboardController>(
      () => PagesDashboardController(),
    );
  }
}
