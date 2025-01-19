import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/controller/home_controller/nav_home_controller.dart';

import '../../view/widgets/home_widget/dialog_widget.dart';

showSettingDialog({required String title}) {
  NavHomeControllerImp controller = Get.find();
  Get.defaultDialog(
    title: '',
    titleStyle: const TextStyle(
      fontSize: 0,
    ),
    content: DialogWidget(
      data: controller.settingData,
    ),
  );
}
