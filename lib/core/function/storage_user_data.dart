import 'dart:convert';

import 'package:get/get.dart';
import 'package:waferna/data/model/user_merchant_model.dart';

import '../../services/my_service.dart';

MyServices myServices = Get.find();

void storageUserData(
  UserMerchantModel? normalUserModel,
) {
  if (normalUserModel != null) {
    myServices.sharedPreferences.setString(
      "userData",
      jsonEncode(
        normalUserModel.toJson(),
      ),
    );
  }
}

UserMerchantModel dataStorage() {
  return UserMerchantModel.fromJson(
    jsonDecode(myServices.sharedPreferences.getString("userData")!),
  );
}
