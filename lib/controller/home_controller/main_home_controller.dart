import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';
import 'package:waferna/data/model/category_model.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/function/handling_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../services/my_service.dart';

abstract class MainHomeController extends GetxController {
  goToCategoryDetailsPage(int index);
  getCategoryData();
  searchCategory();
  clearSearch();
}

class MainHomeControllerImp extends MainHomeController {
  late TextEditingController searchController;
  List<CategoryModel> category = [];
  GetData getDataLogin = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  bool foucs = false;
  @override
  void onInit() {
    searchController = TextEditingController();
    print(myServices.sharedPreferences.getString("userId"));
    print("before==============");
    getCategoryData();
    print("after==============");

    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  goToCategoryDetailsPage(index) {
    Get.toNamed(
      AppRoutes.catagoryDetailsPage,
      arguments: {
        "title": category[index].name,
        "categoryId": category[index].id.toString(),
      },
    );
  }

  @override
  getCategoryData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getDataLogin.getData(
      map: {},
      api: AppApi.getCategoryData,
      reqType: false,
    );
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response["code"] == 200 || response["code"] == 201) {
        List data = response["data"];
        print("data ========================");
        print(data);
        print("data ========================");

        category.addAll(
          data.map(
            (e) {
              print(e);
              return CategoryModel.fromJson(e);
            },
          ),
        );
      }
    } else {
      print("error ===============");
    }

    update();
  }

  @override
  List<CategoryModel> searchCategory() {
    List<CategoryModel> category2 = [];
    category2.addAll(category);
    category2.retainWhere((element) {
      update();
      return element.name!.toLowerCase().contains(
            searchController.text.toLowerCase(),
          );
    });

    return category2;
  }

  @override
  clearSearch() {
    searchController.clear();
    foucs = false;

    update();
  }
}
