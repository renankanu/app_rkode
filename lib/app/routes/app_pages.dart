import 'package:app_rkode/app/modules/home/bindings/home_binding.dart';
import 'package:app_rkode/app/modules/home/views/home_view.dart';
import 'package:app_rkode/app/modules/wifi/bindings/wifi_binding.dart';
import 'package:app_rkode/app/modules/wifi/views/wifi_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.wifi,
      page: () => WifiView(),
      binding: WifiBinding(),
    ),
  ];
}
