import 'package:get/get.dart';

import '../modules/order/Car_details/bindings/car_details_binding.dart';
import '../modules/order/Car_details/views/car_details_view.dart';
import '../modules/order/Checkout/bindings/checkout_binding.dart';
import '../modules/order/Checkout/views/checkout_view.dart';
import '../modules/order/Order_details/bindings/order_details_binding.dart';
import '../modules/order/Order_details/views/order_details_view.dart';
import '../modules/order/Search/bindings/search_binding.dart';
import '../modules/order/Search/views/search_view.dart';
import '../modules/auth/login/bindings/auth_login_binding.dart';
import '../modules/auth/login/views/auth_login_view.dart';
import '../modules/auth/register/bindings/auth_register_binding.dart';
import '../modules/auth/register/views/auth_register_view.dart';
import '../modules/pages/Home/bindings/pages_home_binding.dart';
import '../modules/pages/Home/views/pages_home_view.dart';
import '../modules/pages/dashboard/bindings/pages_dashboard_binding.dart';
import '../modules/pages/dashboard/views/pages_dashboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  //static const INITIAL = Routes.PAGES_DASHBOARD;
  static const INITIAL = Routes.PAGES_DASHBOARD;
  static final routes = [
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
      name: _Paths.PAGES_DASHBOARD,
      page: () => PagesDashboardView(),
      binding: PagesDashboardBinding(),
    ),
    GetPage(
      name: _Paths.PAGES_HOME,
      page: () => pagesHomeView(),
      binding: PagesHomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CAR_DETAILS,
      page: () => const CarDetailsView(),
      binding: CarDetailsBinding(),
    ),
  ];
}
