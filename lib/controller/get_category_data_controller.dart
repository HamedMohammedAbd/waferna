import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/constant/app_api.dart';
import '../core/function/handling_data.dart';
import '../data/data_source/remote/get_data.dart';
import '../data/model/category_model.dart';
import '../services/my_service.dart';

abstract class GetCategoryDataController extends GetxController {
  getCategoryData();
  // searchCategory(String value);
}

class GetCategoryDataControllerImp extends GetCategoryDataController {
  List<CategoryModel> category = [];
  GetData getDataLogin = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  bool isSearch = false;
  @override
  void onInit() {
    getCategoryData();
    super.onInit();
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
    update();

    if (statusRequest == StatusRequest.success) {
      List data = response;

      category.addAll(
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

  List<CategoryModel> getSuggestion(String query) {
    List<CategoryModel> matches = [];
    matches.addAll(category);
    matches.retainWhere((element) {
      return element.image!.toLowerCase().contains(
            query.toLowerCase(),
          );
    });

    return matches;
  }

  updateData() {
    update();
  }
}
