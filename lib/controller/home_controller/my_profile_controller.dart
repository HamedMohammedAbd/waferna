import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';
import 'package:waferna/services/my_service.dart';

import '../../core/function/storage_user_data.dart';

abstract class MyProfileController extends GetxController {
  goToPersonalInformation();
  goToResetPassword();
  asVestor();
  updateUserAccount();
}

class MyProfileControllerImp extends MyProfileController {
  List<Map> pageData = [];
  MyServices myServices = Get.find();
  String userType = "";
  @override
  void onInit() {
    addData();
    userType = dataStorage().userType!;
    super.onInit();
  }

  addData() {
    pageData.addAll(
      [
        {
          "name": "PersonalInformation",
          "icon": Icons.person,
          "onTap": () {
            goToPersonalInformation();
          },
        },
        {
          "name": "ChangePassword",
          "icon": Icons.lock_outline,
          "onTap": () {
            goToResetPassword();
          },
        },
        dataStorage().userType == "customer"
            ? {
                "name": "RegisterAsAMerchant",
                "icon": Icons.upload,
                "onTap": () {
                  updateUserAccount();
                },
              }
            : {
                "name": "RenewSubscription",
                "icon": Icons.star,
                "onTap": () {},
              },
        {
          "name": "privacyPolicy",
          "icon": Icons.privacy_tip_outlined,
          "onTap": () {},
        },
      ],
    );
  }

  @override
  goToPersonalInformation() {
    Get.toNamed(
      AppRoutes.personalInformationPage,
      arguments: {
        "page": "",
      },
    );
  }

  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.updatePassword);
  }

  @override
  asVestor() {
    Get.toNamed(AppRoutes.chooseLoginPage);
  }

  @override
  updateUserAccount() {
    Get.toNamed(
      AppRoutes.personalInformationPage,
      arguments: {
        "page": "upgrade",
      },
    );
  }
}
