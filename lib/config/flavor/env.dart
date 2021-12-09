import 'package:flutter/material.dart';
import 'package:flutter_struture/ui/widgets/application.dart';

import 'flavor_config.dart';

class Env {
  Env() {
    instance = this;
    _init();
  }

  static late Env instance;

  Flavor? flavor;
  FlavorValues? environmentValues;

  _init() {
    WidgetsFlutterBinding.ensureInitialized();

    _initFlavor();
    //Main app
    runApp(Application());
  }

  _initFlavor() {
    FlavorConfig(flavor: flavor!, values: environmentValues!);
  }
}
