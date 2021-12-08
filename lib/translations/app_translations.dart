import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_us/en_us_translations.dart';
import 'vn/vi_vn_translations.dart';


class TranslationService extends Translations {
  static final langCodes = [
    'vi',
    // 'en',
  ];

  static final locales = [
    Locale('vi', 'VN'),
    // Locale('en', 'US'),
  ];

  static final langs = LinkedHashMap.from({
    'vi': "Tiếng Việt",
    // 'en': "English",
  });

  static final locale = Locale('vi', 'VN');
  /// For multi language
  // static final locale = _getLocaleFromLanguage();

  static final fallbackLocale = Locale('vi', 'VN');

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale!);
  }

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale!.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) {
        return locales[i];
      }
    }
    return Get.locale;
  }

  @override
  Map<String, Map<String, String>> get keys => {'en_US': en, 'vi_VN': vi};
}
