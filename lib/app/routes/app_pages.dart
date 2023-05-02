import 'package:get/get.dart';

import '../modules/auth/login/bindings/auth_login_binding.dart';
import '../modules/auth/login/views/auth_login_view.dart';
import '../modules/auth/register/bindings/auth_register_binding.dart';
import '../modules/auth/register/views/auth_register_view.dart';
import '../modules/pages/dashboard/bindings/pages_dashboard_binding.dart';
import '../modules/pages/dashboard/views/pages_dashboard_view.dart';
import '../modules/pages/history/bindings/history_binding.dart';
import '../modules/pages/history/views/history_view.dart';
import '../modules/pages/home/bindings/home_binding.dart';
import '../modules/pages/home/views/home_view.dart';
import '../modules/pages/profile/bindings/pages_profile_binding.dart';
import '../modules/pages/profile/views/pages_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PAGES_DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.PAGES_HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_LOGIN,
      page: () => AuthLoginView(),
      binding: AuthLoginBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_REGISTER,
      page: () => AuthRegisterView(),
      binding: AuthRegisterBinding(),
    ),
    GetPage(
      name: _Paths.PAGES_HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.PAGES_DASHBOARD,
      page: () => PagesDashboardView(),
      binding: PagesDashboardBinding(),
    ),
    GetPage(
      name: _Paths.PAGES_PROFILE,
      page: () => const PagesProfileView(),
      binding: PagesProfileBinding(),
    ),
  ];
}
