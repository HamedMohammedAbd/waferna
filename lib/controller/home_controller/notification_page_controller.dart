import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_api.dart';
import '../../core/function/handling_data.dart';
import '../../data/data_source/remote/get_data.dart';
import '../../services/my_service.dart';

abstract class NotificationPageController extends GetxController {
  getNotificationData();
  // getLanguage();
}

class NotificationPageControllerImp extends NotificationPageController {
  GetData getWaitingList = GetData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List notification = [];
  String local = "en";

  @override
  void onInit() {
    getNotificationData();
    // getLanguage();
    super.onInit();
  }

  @override
  getNotificationData() async {
    statusRequest = StatusRequest.loading;
    var response = await getWaitingList.getData(
      map: {},
      api: AppApi.notificationApi,
      reqType: false,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      var data = response;

      notification.addAll(data["data"]["notifications"]["data"]);
    }

    if (statusRequest == StatusRequest.success) {
    } else {
      print("error ===============");
    }

    update();
  }

  // @override
  // getLanguage() {
  //   local = myServices.sharedPreferences.getString("language")!;

  //   update();
  // }
}
