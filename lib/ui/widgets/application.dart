import 'package:flutter/material.dart';
import '../../config/routes/app_pages.dart';
import '../../config/routes/route_name.dart';
import '../../config/themes/dark_theme.dart';
import '../../config/themes/light_theme.dart';
import '../../translations/app_translations.dart';
import 'package:get/get.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteNames.home,
      getPages: AppPages.appPages,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
