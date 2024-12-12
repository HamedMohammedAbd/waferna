import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CategoryDetailsPageController extends GetxController {}

class CategoryDetailsPageControllerImp extends CategoryDetailsPageController {
  late TextEditingController searchCategoryController;
  String title = "";
  @override
  void onInit() {
    title = Get.arguments["title"];
    searchCategoryController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchCategoryController.dispose();
    super.dispose();
  }
}
