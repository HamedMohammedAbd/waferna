import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';

abstract class SetPasswordPageController extends GetxController {
  saveNewPassword();
}

class SetPasswordPageControllerImp extends SetPasswordPageController {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  saveNewPassword() {
    Get.offAllNamed(AppRoutes.navHomePgae);
    Get.snackbar("success", "password is updated");
  }
}
