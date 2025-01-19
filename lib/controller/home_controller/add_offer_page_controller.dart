// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waferna/core/function/storage_user_data.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/function/handling_data.dart';
import '../../core/function/pick_image.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../data/model/category_model.dart';
import '../../services/my_service.dart';
import 'package:http/http.dart' as http;

abstract class AddOfferPageController extends GetxController {
  isJopType();
  chooseUserJopType(int index);
  chooseCarImage();
  getCategoryData();
  addProducts();
  subscribePage();
}

class AddOfferPageControllerImp extends AddOfferPageController {
  late TextEditingController productNameController;
  late TextEditingController productTypeController;
  late TextEditingController locationController;
  late TextEditingController itemDescriptionController;
  late TextEditingController addContactNumberController;
  late TextEditingController priceController;
  bool isType = false;
  int? userJopType;
  List<CategoryModel> jopTypeList = [];
  List<XFile> productsImage = [];
  String categoryId = "";
  GetData getDataLogin = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  bool subscribe = false;

  @override
  void onInit() async {
    addContactNumberController = TextEditingController();
    productNameController = TextEditingController();
    productTypeController = TextEditingController();
    locationController = TextEditingController();
    itemDescriptionController = TextEditingController();
    addContactNumberController.text = dataStorage().phone!;
    priceController = TextEditingController();
    await getCategoryData();
    super.onInit();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productTypeController.dispose();
    locationController.dispose();
    itemDescriptionController.dispose();
    addContactNumberController.dispose();
    priceController.dispose();
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
  chooseCarImage() async {
    productsImage = await pickeImages();
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

  @override
  addProducts() async {
    uploadContent(images: productsImage, additionalData: {
      "name": productNameController.text,
      "description": itemDescriptionController.text,
      "category_id": categoryId,
      "user_id": dataStorage().id.toString(),
      "price": priceController.text,
      "place": locationController.text,
      "phone": addContactNumberController.text,
    });
    // uploadImagesWithData(
    //   productsImage,
    //   {
    //     "name": productNameController.text,
    //     "description": itemDescriptionController.text,
    //     "category_id": categoryId,
    //     "user_id": dataStorage().id.toString(),
    //     "price": priceController.text,
    //     "place": locationController.text,
    //     "phone": addContactNumberController.text,
    //     "image": "images",
    //   },
    // );
    // statusRequest = StatusRequest.loading;
    // var response = await getDataLogin.getData(
    //   map: {
    //     "name": productNameController.text,
    //     "description": itemDescriptionController.text,
    //     "category_id": categoryId,
    //     "user_id": dataStorage().id.toString(),
    //     "price": priceController.text,
    //     "place": locationController.text,
    //     "phone": addContactNumberController.text,
    //   },
    //   api: AppApi.addProducts,
    // );
    // statusRequest = handlingData(response);

    // if (statusRequest == StatusRequest.success) {
    //   // Get.offAllNamed(AppRoutes.loginPage);
    // } else {
    //   print("error ===============");
    // }
    // if (response["code"] == 401) {
    //   subscribe = true;
    //   Get.snackbar("", "${response["message"]}");
    // }

    // update();
  }

  uploadContent({
    required List<XFile> images,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      // تجهيز URL الخاص بال API
      var url = Uri.parse(AppApi.addProducts);

      // إنشاء طلب متعدد الأجزاء
      var request = http.MultipartRequest('POST', url);

      // إضافة headers
      request.headers.addAll({
        "x-api-token": "vHpsSUCU1Sc9Kko0e1OtP2G5SoDuPgjDHROaCTVR3Bw=",
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString("token")}',
      });

      // إضافة البيانات الإضافية إذا وجدت
      if (additionalData != null) {
        additionalData.forEach((key, value) {
          request.fields[key] = value.toString();
        });
      }

      // إضافة الصور
      for (int i = 0; i < images.length; i++) {
        var multipartFile = await http.MultipartFile.fromPath(
          "image", // اسم المصفوفة في API
          File(images[i].path).path,
          // يمكنك إضافة نوع MIME للصورة إذا كنت بحاجة إليه
          // contentType: MediaType('image', 'jpeg'),
        );
        request.files.add(multipartFile);
      }

      // إرسال الطلب
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // التحقق من نجاح العملية
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)["code"] != 200) {
          subscribe = true;
        } else {
          print('Response: ${jsonDecode(response.body)["code"]}');
          print('Response: ${jsonDecode(response.body)["message"]}');
        }
        Get.snackbar(
          "",
          "${jsonDecode(response.body)["message"]}",
        );
        productNameController.clear();
        productTypeController.clear();
        locationController.clear();
        itemDescriptionController.clear();
        addContactNumberController.clear();
        priceController.clear();
      } else {
        print('فشل في رفع المحتوى. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('حدث خطأ أثناء رفع المحتوى: $e');
    }
    update();
  }

  @override
  subscribePage() async {
    final Uri url = Uri.parse('https://wafrna.com/plan');

    if (await launchUrl(url)) {}
    print("yoou must go to subscribe page");
  }
}
