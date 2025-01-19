import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';
import 'package:waferna/services/my_service.dart';

abstract class ChooseLoginPageController extends GetxController {
  createAccount();
  loginPage();
  vistor();
}

class ChooseLoginPageControllerImp extends ChooseLoginPageController {
  MyServices myServices = Get.find();
  @override
  createAccount() {
    Get.offAllNamed(
      AppRoutes.signUpPage,
      arguments: {
        "data": "",
      },
    );
  }

  @override
  loginPage() {
    Get.offAllNamed(AppRoutes.loginPage);
  }

  @override
  vistor() {
    Get.offAllNamed(AppRoutes.navHomePgae);
    myServices.sharedPreferences.setString(
      "userType",
      "2",
    );
  }
}
