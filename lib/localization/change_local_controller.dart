import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../services/my_service.dart';

class ChangeLocaleController extends GetxController {
  Locale? language;
  MyServices myServicesController = Get.find();
  void changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    myServicesController.sharedPreferences.setString('language', languageCode);
    Get.updateLocale(locale);
  }

  void startLanguage() {
    String? sharedPreferences =
        myServicesController.sharedPreferences.getString('language');
    if (sharedPreferences == 'ar') {
      language = const Locale('ar');
    } else if (sharedPreferences == 'en') {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    update();
  }

  @override
  void onInit() {
    startLanguage();
    super.onInit();
  }

  changeLanguageUser(String languageCode) {
    changeLanguage(languageCode);
    update();
  }
}
