import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/function/handling_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../services/my_service.dart';

abstract class UpdatePasswordController extends GetxController {
  updatePassword();
}

class UpdatePasswordControllerImp extends UpdatePasswordController {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  GetData updatePasswordData = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  @override
  void onInit() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  updatePassword() async {
    statusRequest = StatusRequest.loading;
    var response = await updatePasswordData.getData(
      map: {
        "current_password": oldPasswordController.text,
        "password": newPasswordController.text,
        "password_confirmation": confirmPasswordController.text,
      },
      api: AppApi.updatePassword,
    );
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      print(response);
      Get.defaultDialog(
        title: "",
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.successPassword,
            ),
            SizedBox(
              height: heigth(70),
            ),
            TextCustom(
              text: "updatedSuccess".tr,
              textSize: AppFontSize.size15,
              textColor: AppColor.primaryColor,
            ),
          ],
        ),
      );
      Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
        () {
          Get.back();
          Get.back();
        },
      );
    } else {
      print("error ===============");
    }

    update();
  }
}
