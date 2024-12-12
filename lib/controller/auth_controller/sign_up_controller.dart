import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/constant/app_routes.dart';

abstract class SignUpController extends GetxController {
  backPage();
  changeUserType(String userType);
  isJopType();
  chooseUserJopType(int index);
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController phoneNumberController;
  late TextEditingController fullNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController dealerNumberController;
  late TextEditingController merchantActivityController;
  late TextEditingController typeOfWorkController;
  String userType = "Buyer";
  bool isType = false;
  int? userJopType;
  List<String> jopTypeList = [
    "ملابس",
    "ملابس",
    "ملابس",
    "ملابس",
    "ملابس",
    "ملابس",
    "ملابس",
    "ملابس",
    "ملابس",
    "ملابس",
    "ملابس",
    "ملابس",
  ];
  @override
  void onInit() {
    phoneNumberController = TextEditingController();
    fullNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    dealerNumberController = TextEditingController();
    merchantActivityController = TextEditingController();
    typeOfWorkController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dealerNumberController.dispose();
    merchantActivityController.dispose();
    typeOfWorkController.dispose();
    super.dispose();
  }

  @override
  backPage() {
    Get.offAllNamed(AppRoutes.chooseLoginPage);
  }

  @override
  changeUserType(String userType) {
    this.userType = userType;
    update();
  }

  @override
  isJopType() {
    isType = !isType;
    update();
  }

  @override
  chooseUserJopType(int index) {
    userJopType = index;
    typeOfWorkController.text = jopTypeList[index];
    isJopType();
  }
}
