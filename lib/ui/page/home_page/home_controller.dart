import 'package:flutter_struture/config/flavor/env.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('home ${Env.instance.environmentValues!.baseUrl}');


  }



}
