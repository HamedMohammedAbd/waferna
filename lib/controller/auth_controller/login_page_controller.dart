// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';
import 'package:waferna/services/my_service.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/function/handling_data.dart';
import '../../core/function/storage_user_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../data/model/user_merchant_model.dart';

abstract class LoginPageController extends GetxController {
  backPage();
  forgotPassword();
  createAccount();
  loginData();
}

class LoginPageControllerImp extends LoginPageController {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  GetData getDataLogin = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

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
    Get.offAllNamed(AppRoutes.signUpPage, arguments: {
      "data": "",
    });
  }

  @override
  forgotPassword() {
    Get.toNamed(AppRoutes.resetPasswordPhone);
  }

  @override
  loginData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await getDataLogin.getData(
        map: {
          "phone": phoneNumberController.text.trim(),
          "password": passwordController.text,
        },
        api: AppApi.loginAPI,
      );
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response["code"] == 200 || response["code"] == 201) {
          String token = response["data"]["token"];
          myServices.sharedPreferences.setString("token", token);
          myServices.sharedPreferences.setString('step', "2");

          UserMerchantModel userMerchantModel =
              UserMerchantModel.fromJson(response["data"]["user"]);
          print(response["data"]["user"]);

          storageUserData(
            userMerchantModel,
          );
          Get.offAllNamed(AppRoutes.navHomePgae);
          print(dataStorage().userType);
        } else {
          Get.snackbar(
            "",
            "${response["data"]["message"]}",
            duration: const Duration(
              seconds: 2,
            ),
          );
        }
        // }
        //
        // catch (e) {
        //   Get.snackbar(
        //     "",
        //     e.toString(),
        //     duration: const Duration(
        //       seconds: 2,
        //     ),
        //   );
      }
    } else {
      print("error ===============");
    }

    update();
  }
}
// }
