import 'package:flutter_struture/ui/home_page/home_bindding.dart';
import 'package:flutter_struture/ui/home_page/home_page.dart';
import 'package:get/get.dart';

import 'route_name.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(
        name: RouteNames.home,
        page: () => const HomePage(),
        binding: HomeBinding())
  ];
}
