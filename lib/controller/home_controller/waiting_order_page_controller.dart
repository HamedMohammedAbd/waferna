import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class WaitingOrderPageController extends GetxController {
  chooseUserJopType(int index);
  isJopType();
  addDay();
  removeDay();
  addWaitingOrder();
}

class WaitingOrderPageControllerImp extends WaitingOrderPageController {
  late TextEditingController productNameController;
  late TextEditingController productTypeController;
  bool isType = false;
  int? userJopType;
  int dayWait = 1;
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
    productNameController = TextEditingController();
    productTypeController = TextEditingController();
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
    productTypeController.text = jopTypeList[index];
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
        "Error",
        "Can't day be less than one day",
      );
    }

    update();
  }

  @override
  addWaitingOrder() {}
}
