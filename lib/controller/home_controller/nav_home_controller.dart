import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_routes.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../view/widgets/home_widget/settings_buttons_widget.dart';

abstract class NavHomeController extends GetxController {
  changeCurrentIndex(int index);
  showSettings();
  goToWaitingList();
  goToNotificationPage();
}

class NavHomeControllerImp extends NavHomeController {
  int currentIndex = 0;
  List<Map<String, dynamic>> settingData = [];
  @override
  void onInit() {
    settingData.addAll([
      {
        "name": "notification",
        "onTap": () {
          goToNotificationPage();
        },
      },
      {
        "name": "theme",
        "onTap": () {},
      },
      {
        "name": "logout",
        "onTap": () {},
      },
      {
        "name": "waitList",
        "onTap": () {
          goToWaitingList();
        },
      },
    ]);
    super.onInit();
  }

  @override
  changeCurrentIndex(index) {
    currentIndex = index;
    update();
  }

  @override
  showSettings() {
    Get.defaultDialog(
      title: "Settings".tr,
      content: Column(
        children: [
          Container(
            height: 2,
            color: AppColor.blackColor,
            width: width(1),
            margin: EdgeInsets.symmetric(
              horizontal: width(
                20,
              ),
            ),
          ),
          SizedBox(
            height: heigth(15),
          ),
          ...List.generate(
            settingData.length,
            (index) {
              String name = settingData[index]["name"];
              return SettingsButtonsWidget(
                buttonName: name,
                onTap: settingData[index]["onTap"],
              );
            },
          ),
          SizedBox(
            height: heigth(80),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: TextCustom(
                  text: "close".tr,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  goToWaitingList() {
    Get.toNamed(AppRoutes.waitingListPage);
  }

  @override
  goToNotificationPage() {
    Get.toNamed(AppRoutes.notificationPage);
  }
}
