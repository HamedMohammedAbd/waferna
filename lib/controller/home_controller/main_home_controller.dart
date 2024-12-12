import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';

abstract class MainHomeController extends GetxController {
  goToCategoryDetailsPage();
}

class MainHomeControllerImp extends MainHomeController {
  late TextEditingController searchController;
  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  goToCategoryDetailsPage() {
    Get.toNamed(
      AppRoutes.catagoryDetailsPage,
      arguments: {
        "title": "ملابس",
      },
    );
  }
}
