import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';

import '../../services/my_service.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == "2") {
      return const RouteSettings(
        name: AppRoutes.navHomePgae,
      );
    }
    if (myServices.sharedPreferences.getString('step') == "1") {
      return const RouteSettings(
        name: AppRoutes.chooseLoginPage,
      );
    }

    return null;
  }
}
