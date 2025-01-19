import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/handling_data_request.dart';
import 'package:waferna/view/widgets/home_widget/home_app_bar.dart';

import '../../../controller/home_controller/notification_page_controller.dart';
import '../../widgets/home_widget/notification_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationPageControllerImp());
    return Scaffold(
      appBar: homeAppBar(
        title: "notification".tr,
        isSetting: false,
        heightMarging: heigth(21),
        widthMargin: width(80),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          width(12.7),
        ),
        child: GetBuilder<NotificationPageControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  ...List.generate(
                    controller.notification.length,
                    (index) {
                      String data =
                          controller.notification[index]["data"]["body"];
                      String date = timeago.format(
                        DateTime.parse(
                            controller.notification[index]["created_at"]),
                        locale: controller.local,
                      );

                      return NotificationWidget(
                        data: data,
                        date: date,
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
