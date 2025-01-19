import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/function/handling_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../data/model/waiting_list_product_model.dart';
import '../../services/my_service.dart';

abstract class WaitingListPageController extends GetxController {
  getWaitingData();
}

class WaitingListPageControllerImp extends WaitingListPageController {
  GetData getWaitingList = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List<WaitingListProductModel> waitingList = [];

  @override
  void onInit() {
    print(myServices.sharedPreferences.getString("token"));
    getWaitingData();
    super.onInit();
  }

  @override
  getWaitingData() async {
    statusRequest = StatusRequest.loading;
    var response = await getWaitingList.getData(
      map: {},
      api: AppApi.waitingListAPI,
      reqType: false,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List data = response["data"];
      waitingList.addAll(
        data.map(
          (e) => WaitingListProductModel.fromJson(e),
        ),
      );
    }

    if (statusRequest == StatusRequest.success) {
    } else {
      print("error ===============");
    }

    update();
  }
}
