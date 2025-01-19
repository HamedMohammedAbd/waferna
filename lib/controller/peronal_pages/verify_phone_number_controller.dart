import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';

abstract class VerifyPhoneNumberController extends GetxController {
  resentVerifyCode();
  verifyCode();
}

class VerifyPhoneNumberControllerImp extends VerifyPhoneNumberController {
  String? page;
  @override
  void onInit() {
    page = Get.arguments["page"];
    super.onInit();
  }

  @override
  resentVerifyCode() {}

  @override
  verifyCode() {
    page == "signUp"
        ? Get.offAllNamed(AppRoutes.navHomePgae)
        : Get.toNamed(AppRoutes.setPasswordPage);
  }
}
