import 'package:get/get.dart';

validationFunction({
  required String value,
  required int min,
  required int max,
  required String type,
  String? password,
  String? confirmPassword,
}) {
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "notValidUsername".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "notValidEmail".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "notValidPhone".tr;
    }
  }

  if (value.isEmpty) {
    return "can'tBeEmpty".tr;
  }

  if (value.length < min) {
    return "${"less".tr}$min";
  }

  if (value.length > max) {
    return "${"more".tr}$max";
  }
  if (password != confirmPassword) {
    return "the password not confirm";
  }
}
