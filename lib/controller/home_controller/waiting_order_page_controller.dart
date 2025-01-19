import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/function/handling_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../data/model/category_model.dart';
import '../../services/my_service.dart';

abstract class WaitingOrderPageController extends GetxController {
  chooseUserJopType(int index);
  isJopType();
  addDay();
  removeDay();
  addWaitingOrder();
  getCategoryData();
}

class WaitingOrderPageControllerImp extends WaitingOrderPageController {
  late TextEditingController productNameController;
  late TextEditingController productTypeController;
  bool isType = false;
  int? userJopType;
  int dayWait = 1;
  String categoryId = "";
  GetData addWaitingProduct = GetData(Get.find());
  late StatusRequest statusRequest;
  late StatusRequest statusRequest2 = StatusRequest.none;
  MyServices myServices = Get.find();
  List<CategoryModel> jopTypeList = [];
  @override
  void onInit() async {
    productNameController = TextEditingController();
    productTypeController = TextEditingController();
    await getCategoryData();
    super.onInit();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productTypeController.dispose();
    super.dispose();
  }

  @override
  isJopType() {
    isType = !isType;
    update();
  }

  @override
  chooseUserJopType(int index) {
    userJopType = index;
    productTypeController.text = jopTypeList[index].name!;
    categoryId = jopTypeList[index].id.toString();
    isJopType();
  }

  @override
  addDay() {
    dayWait++;
    update();
  }

  @override
  removeDay() {
    if (dayWait > 1) {
      dayWait--;
    } else {
      Get.snackbar(
        "Error".tr,
        "message".tr,
      );
    }

    update();
  }

  @override
  addWaitingOrder() async {
    print(myServices.sharedPreferences.getString("token"));

    statusRequest2 = StatusRequest.loading;

    update();
    var response2 = await addWaitingProduct.getData(
      map: {
        "name": productNameController.text,
        "description": "value",
        "category_id": categoryId,
        "day_count": dayWait.toString(),
      },
      api: AppApi.waitingListAPI,
    );
    statusRequest2 = handlingData(response2);
    print(categoryId);
    print(productNameController.text);
    print(dayWait.toString());

    if (statusRequest2 == StatusRequest.success) {
      Get.snackbar("", "${response2["data"]["message"]}");
      productNameController.clear();
      productTypeController.clear();

      print(response2["data"]["message"]);
    } else {
      print("$statusRequest2" "==============");
      print("error ===============");
    }

    update();
  }

  @override
  getCategoryData() async {
    statusRequest = StatusRequest.loading;
    var response = await addWaitingProduct.getData(
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
}
