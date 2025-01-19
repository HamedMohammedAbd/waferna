import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/handling_data_request.dart';
import 'package:waferna/view/widgets/home_widget/home_app_bar.dart';

import '../../../controller/home_controller/waiting_list_page_controller.dart';
import '../../widgets/home_widget/waiting_list_card_widget.dart';

class WaitingListPage extends StatelessWidget {
  const WaitingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WaitingListPageControllerImp());
    return Scaffold(
      appBar: homeAppBar(
        title: "waitList".tr,
        isSetting: false,
        heightMarging: heigth(21),
        widthMargin: width(80),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          width(18.143),
        ),
        child: GetBuilder<WaitingListPageControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  ...List.generate(
                    controller.waitingList.length,
                    (index) {
                      String name = controller.waitingList[index].name!;
                      String description =
                          controller.waitingList[index].description!;
                      String dayCount =
                          controller.waitingList[index].dayCount.toString();
                      return WaitingListCardWidget(
                        name: name,
                        description: description,
                        dayCount: dayCount,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
