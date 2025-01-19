import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waferna/core/constant/app_api.dart';
import 'package:waferna/services/my_service.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../core/function/pick_image.dart';
import '../../core/function/storage_user_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../data/model/category_model.dart';
import '../../data/model/user_merchant_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

abstract class PersonalInformationPageController extends GetxController {
  backPage();
  isJopType();
  chooseUserJopType(int index);
  editData();
  saveNewDataWithImage();
  uploadImage();
  getCategoryData();
  saveEditData();
}

class PersonalInformationPageControllerImp
    extends PersonalInformationPageController {
  late TextEditingController phoneNumberController;
  late TextEditingController fullNameController;
  late TextEditingController dealerNumberController;
  late TextEditingController merchantActivityController;
  late TextEditingController typeOfWorkController;
  late TextEditingController emailController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late UserMerchantModel userMerchantModel;

  MyServices myServices = Get.find();
  String userType = "";
  bool isType = false;
  int? userJopType;
  bool isEdit = true;
  XFile? image;
  List<CategoryModel> jopTypeList = [];
  String upgrade = "";
  GetData getDataLogin = GetData(Get.find());
  late StatusRequest statusRequest;
  String imageUrl = "";
  String categoryId = "";

  @override
  void onInit() async {
    phoneNumberController = TextEditingController();
    fullNameController = TextEditingController();
    dealerNumberController = TextEditingController();
    merchantActivityController = TextEditingController();
    typeOfWorkController = TextEditingController();
    emailController = TextEditingController();
    upgrade = Get.arguments["page"];
    isEdit = upgrade != "" ? false : true;

    getInitData();
    await getCategoryData();
    super.onInit();
  }

  getInitData() {
    userMerchantModel = dataStorage();
    userType = upgrade != "" ? "merchant" : userMerchantModel.userType!;
    fullNameController.text = userMerchantModel.name!;
    emailController.text = userMerchantModel.email!;
    phoneNumberController.text = userMerchantModel.phone!;
    imageUrl = userMerchantModel.imageUrl!;
    dealerNumberController.text = userMerchantModel.commercialRegister == null
        ? ""
        : userMerchantModel.commercialRegister.toString();
    merchantActivityController.text = userMerchantModel.discription ?? "";
    typeOfWorkController.text = "";
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    fullNameController.dispose();
    dealerNumberController.dispose();
    merchantActivityController.dispose();
    typeOfWorkController.dispose();
    emailController.dispose();
    super.dispose();
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
  backPage() {
    Get.back();
  }

  @override
  isJopType() {
    isType = !isType;
    update();
  }

  @override
  chooseUserJopType(int index) {
    userJopType = index;
    typeOfWorkController.text = jopTypeList[index].name!;
    categoryId = jopTypeList[index].id.toString();

    isJopType();
  }

  @override
  editData() {
    isEdit = false;

    update();
  }

  // دالة لاختيار الصورة من المعرض
  static Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80, // ضغط الصورة لتقليل حجم الملف
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  @override
  saveEditData() async {
    updateImageAndMapData(
      data: {},
      file: File(image!.path),
    );
  }

  @override
  saveNewDataWithImage() async {
    Map<String, dynamic> data = {
      "_method": "PUT",
      "name": fullNameController.text.trim(),
      "phone": phoneNumberController.text,
      "email": emailController.text,
      "user_type": userType,
      "commercial_register": dealerNumberController.text,
      "categories_id[]": categoryId,
      "discription": merchantActivityController.text,
    };
    if (formState.currentState!.validate()) {
      if (image != null) {
        updateImageAndMapData(data: data, file: File(image!.path));
        userMerchantModel.name = fullNameController.text.trim();
        userMerchantModel.email = emailController.text.trim();
        userMerchantModel.phone = phoneNumberController.text.trim();
        userMerchantModel.userType = userType.trim();
        userMerchantModel.commercialRegister =
            int.parse(dealerNumberController.text.trim());
        storageUserData(userMerchantModel);
        print(dataStorage());
      } else {
        statusRequest = StatusRequest.loading;
        var response = await getDataLogin.getData(
            map: data,
            api: AppApi.updateProfileDataApi + dataStorage().id.toString(),
            header: {
              "x-api-token": "vHpsSUCU1Sc9Kko0e1OtP2G5SoDuPgjDHROaCTVR3Bw=",
              'Accept': 'application/json',
              'Content-Type': 'application/x-www-form-urlencoded',
              'Authorization':
                  'Bearer ${myServices.sharedPreferences.getString("token")}',
            });
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          isEdit = true;
          Get.snackbar(
            "success",
            response["data"]["message"].toString(),
          );
          userMerchantModel.name = fullNameController.text.trim();
          userMerchantModel.email = emailController.text.trim();
          userMerchantModel.phone = phoneNumberController.text.trim();
          userMerchantModel.userType = userType.trim();
          userMerchantModel.commercialRegister =
              int.parse(dealerNumberController.text.trim());
          storageUserData(userMerchantModel);
          Get.put(PersonalInformationPageControllerImp());
          print(
            phoneNumberController.text.startsWith("+966") ||
                    phoneNumberController.text.startsWith("00966")
                ? phoneNumberController.text
                : "+966${phoneNumberController.text}",
          );
          update();
        } else {
          print("erorr ================ ");
        }
      }
    }
  }

  updateImageAndMapData({
    required Map data,
    required File file,
  }) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(
        "${AppApi.updateProfileDataApi}${dataStorage().id!}",
      ),
    );
    request.headers.addAll({
      "x-api-token": "vHpsSUCU1Sc9Kko0e1OtP2G5SoDuPgjDHROaCTVR3Bw=",
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization':
          'Bearer ${myServices.sharedPreferences.getString("token")}',
    });
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());

    var multipartRequest = http.MultipartFile(
      'image',
      stream,
      length,
      filename: basename(file.path),
    );
    request.files.add(multipartRequest);

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myRequest = await request.send();

    var response = await http.Response.fromStream(myRequest);

    if (myRequest.statusCode == 200) {
      isEdit = true;
      print("edit ============");
      print(jsonDecode(response.body));
      print(jsonDecode(response.statusCode.toString()));
      Get.snackbar("", jsonDecode(response.statusCode.toString()));
      // return jsonDecode(response.body);
    } else {
      Get.snackbar("", "Error ${myRequest.statusCode}");
    }
    update();
  }

  @override
  uploadImage() async {
    image = await pickeImage(source: ImageSource.camera);
    update();
  }
}
