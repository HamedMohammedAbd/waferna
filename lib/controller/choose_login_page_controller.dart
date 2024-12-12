import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';

abstract class ChooseLoginPageController extends GetxController {
  createAccount();
  loginPage();
  vistor();
}

class ChooseLoginPageControllerImp extends ChooseLoginPageController {
  @override
  createAccount() {
    Get.offAllNamed(AppRoutes.signUpPage);
  }

  @override
  loginPage() {
    Get.offAllNamed(AppRoutes.loginPage);
  }

  @override
  vistor() {
    Get.offAllNamed(AppRoutes.navHomePgae);
  }
}
