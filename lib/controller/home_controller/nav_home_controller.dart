import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';
import 'package:waferna/core/function/storage_user_data.dart';

import 'package:waferna/services/my_service.dart';

import '../../core/function/logout.dart';

abstract class NavHomeController extends GetxController {
  changeCurrentIndex(int index);

  goToWaitingList();
  goToNotificationPage();
  changeLanguagePage();
}

class NavHomeControllerImp extends NavHomeController {
  int currentIndex = 0;
  List<Map<String, dynamic>> settingData = [];
  MyServices myServices = Get.find();
  String title = "Settings", close = "close";
  @override
  void onInit() {
    settingData.addAll(dataStorage().userType != "customer"
        ? [
            {
              "name": "notification",
              "onTap": () {
                goToNotificationPage();
              },
            },
            {
              "name": "changeLanguage",
              "onTap": () {
                changeLanguagePage();
              },
            },
            {
              "name": "logout",
              "onTap": () {
                logout();
              },
            },
            {
              "name": "waitList",
              "onTap": () {
                goToWaitingList();
              },
            },
          ]
        : [
            {
              "name": "notification",
              "onTap": () {
                goToNotificationPage();
              },
            },
            {
              "name": "changeLanguage",
              "onTap": () {
                changeLanguagePage();
              },
            },
            {
              "name": "logout",
              "onTap": () {
                logout();
              },
            },
          ]);
    // title = "Settings";
    // close = "close";
    super.onInit();
  }

  @override
  changeCurrentIndex(index) {
    currentIndex = index;
    update();
  }

  @override
  goToWaitingList() {
    Get.toNamed(AppRoutes.waitingListPage);
  }

  @override
  goToNotificationPage() {
    Get.toNamed(AppRoutes.notificationPage);
  }

  @override
  changeLanguagePage() {
    Get.toNamed(AppRoutes.changeLanguagePage);
  }
}
