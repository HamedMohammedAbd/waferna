import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:waferna/data/model/products_model.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/function/handling_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../services/my_service.dart';

abstract class CategoryDetailsPageController extends GetxController {
  getProductData();
}

class CategoryDetailsPageControllerImp extends CategoryDetailsPageController {
  late TextEditingController searchCategoryController;
  String title = "";
  List<ProductsModel> products = [];
  GetData getProductsData = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  String categoryId = "";
  @override
  void onInit() {
    title = Get.arguments["title"];
    categoryId = Get.arguments["categoryId"];
    searchCategoryController = TextEditingController();
    getProductData();
    super.onInit();
  }

  @override
  void dispose() {
    searchCategoryController.dispose();
    super.dispose();
  }

  @override
  getProductData() async {
    statusRequest = StatusRequest.loading;
    var response = await getProductsData.getData(
      map: {},
      api: AppApi.getProductsData + categoryId,
      reqType: false,
    );
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      List data = response["data"];

      products.addAll(
        data.map(
          (e) {
            return ProductsModel.fromJson(e);
          },
        ).where((el) => el.categoryId.toString() == categoryId),
      );
    } else {
      print("error ===============");
    }

    update();
  }
}
