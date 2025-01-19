import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/function/handling_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../services/my_service.dart';

abstract class RestetPasswordPhoneController extends GetxController {
  nextPage();
}

class RestetPasswordPhoneControllerImp extends RestetPasswordPhoneController {
  late TextEditingController emailController;
  GetData resetData = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  nextPage() async {
    statusRequest = StatusRequest.loading;
    var response = await resetData.getData(
      map: {
        "email": emailController.text.trim(),
      },
      api: AppApi.sendEmailForgotpasswrod,
    );
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response["code"] == 401) {
        print(response["code"]);
        print("البيانات غير متطابقة");
        Get.snackbar("Error".tr, "DataDoesNotMatch".tr);
      } else {
        Get.snackbar(
          "Attention",
          "send restart password data to email",
        );
        Get.offAllNamed(AppRoutes.loginPage);
      }
    } else {
      print("error ===============");
    }

    update();
  }
}
