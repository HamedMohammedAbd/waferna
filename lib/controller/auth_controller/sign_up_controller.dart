import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:waferna/services/my_service.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/constant/app_routes.dart';
import '../../core/function/handling_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../data/model/category_model.dart';

abstract class SignUpController extends GetxController {
  backPage();
  changeUserType(String userType);
  isJopType();
  chooseUserJopType(int index);
  signUpUser();
  getCategoryData();
  // searchCategory();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController phoneNumberController;
  late TextEditingController fullNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController dealerNumberController;
  late TextEditingController merchantActivityController;
  late TextEditingController typeOfWorkController;
  late TextEditingController emailController;
  late GlobalKey<FormState> formStateKey;
  String userType = "Buyer";
  bool isType = false;
  int? userJopType;
  String categoryId = "";
  String upgrade = "";

  Map<String, dynamic> data = {};
  GetData getDataLogin = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List<CategoryModel> jopTypeList = [];
  @override
  void onInit() async {
    formStateKey = GlobalKey<FormState>();

    phoneNumberController = TextEditingController();
    fullNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    dealerNumberController = TextEditingController();
    merchantActivityController = TextEditingController();
    typeOfWorkController = TextEditingController();
    emailController = TextEditingController();

    myServices.sharedPreferences.setString(
      "userType",
      "customer",
    );

    await getCategoryData();
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
    emailController.dispose();

    super.dispose();
  }

  @override
  backPage() {
    upgrade == "upgrade"
        ? Get.back()
        : Get.offAllNamed(AppRoutes.chooseLoginPage);
  }

  @override
  changeUserType(String userType) {
    this.userType = userType;

    myServices.sharedPreferences.setString(
      "userType",
      userType == "Buyer" ? "customer" : "merchant",
    );
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
    typeOfWorkController.text = jopTypeList[index].name.toString();
    categoryId = jopTypeList[index].id.toString();
    isJopType();
  }

  @override
  signUpUser() async {
    print(userType);
    if (formStateKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      Map<String, String> data = userType != "Buyer"
          ? {
              "phone": phoneNumberController.text.trim(),
              "password": passwordController.text,
              "name": fullNameController.text,
              "user_type": userType == "Buyer" ? "customer" : "merchant",
              "password_confirmation": confirmPasswordController.text,
              "email": emailController.text.toLowerCase().trim(),
              "commercial_register": dealerNumberController.text,
              "categories_id[]": categoryId,
            }
          : {
              "phone": phoneNumberController.text.trim(),
              "password": passwordController.text,
              "name": fullNameController.text,
              "user_type": userType == "Buyer" ? "customer" : "merchant",
              "password_confirmation": confirmPasswordController.text,
              "email": emailController.text.toLowerCase().trim(),
            };
      print(data);
      var response = await getDataLogin.getData(
        map: data,
        api: AppApi.signUpAPI,
      );
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response["code"] == 200 || response["code"] == 201) {
          print(response["code"]);
          Get.snackbar("",
              "${response["data"]["message"]}\n تم ارسال رسالة تأكيد على جيميلك");
          Get.offAllNamed(AppRoutes.loginPage);
        } else {
          Get.snackbar("", "${response["data"]["message"]}");
        }
      } else {
        Get.snackbar("", "${response["data"]["message"]}");
      }
    }

    update();
  }

  @override
  getCategoryData() async {
    statusRequest = StatusRequest.loading;
    var response = await getDataLogin.getData(
      map: {},
      api: AppApi.getCategoryData,
      reqType: false,
    );
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      List data = response["data"];

      jopTypeList.addAll(
        data.map(
          (e) {
            return CategoryModel.fromJson(e);
          },
        ),
      );
    } else {
      print("error ===============");
    }

    update();
  }

  // @override
  // List<CategoryModel> searchCategory() {
  //   List<CategoryModel> category2 = [];
  //   category2.addAll(jopTypeList);
  //   category2.retainWhere((element) {
  //     update();
  //     return element.name!.toLowerCase().contains(
  //           typeOfWorkController.text.toLowerCase(),
  //         );
  //   });

  //   return category2;
  // }
}
