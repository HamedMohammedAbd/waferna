import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/function/pick_image.dart';

abstract class AddOfferPageController extends GetxController {
  isJopType();
  chooseUserJopType(int index);
  chooseCarImage();
}

class AddOfferPageControllerImp extends AddOfferPageController {
  late TextEditingController productNameController;
  late TextEditingController productTypeController;
  late TextEditingController locationController;
  late TextEditingController itemDescriptionController;
  late TextEditingController addContactNumberController;
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
  List<XFile?>? carImage = [];

  @override
  void onInit() {
    productNameController = TextEditingController();
    productTypeController = TextEditingController();
    locationController = TextEditingController();
    itemDescriptionController = TextEditingController();
    addContactNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productTypeController.dispose();
    locationController.dispose();
    itemDescriptionController.dispose();
    addContactNumberController.dispose();
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
  chooseCarImage() async {
    carImage = await pickeImages();
    update();
  }
}
