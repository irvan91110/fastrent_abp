import 'package:fastrent/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PagesDashboardController extends GetxController {
  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  void changePage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (index == 1 || index == 2) {
      if (!isLoggedIn) {
        Get.offAllNamed(Routes.AUTH_LOGIN);
      } else {
        _currentIndex.value = index;
      }
    } else {
      _currentIndex.value = index;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
