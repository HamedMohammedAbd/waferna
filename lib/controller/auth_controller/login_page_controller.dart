import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';

abstract class LoginPageController extends GetxController {
  backPage();
  forgotPassword();
  createAccount();
}

class LoginPageControllerImp extends LoginPageController {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  @override
  void onInit() {
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  backPage() {
    Get.offAllNamed(AppRoutes.chooseLoginPage);
  }

  @override
  createAccount() {
    Get.offAllNamed(AppRoutes.signUpPage);
  }

  @override
  forgotPassword() {}
}
