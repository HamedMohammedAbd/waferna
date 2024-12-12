import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/controller/home_controller/nav_home_controller.dart';
import 'package:waferna/view/widgets/gloable_widget/back_icon_button.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../gloable_widget/text_custom.dart';

AppBar homeAppBar({
  required String title,
  bool isSetting = true,
  double? heightMarging,
  double? widthMargin,
  void Function()? onTap,
}) {
  NavHomeControllerImp controller = Get.put(NavHomeControllerImp());
  return AppBar(
    elevation: 0,
    backgroundColor: AppColor.scaffoldColor,
    title: TextCustom(
      text: title,
      textSize: AppFontSize.size20,
    ),
    leading: isSetting
        ? IconButton(
            onPressed: () => controller.showSettings(),
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColor.primaryColor,
            ),
          )
        : BackIconButton(
            heightMargin: heightMarging,
            widthMargin: widthMargin,
            onTap: onTap,
          ),
    leadingWidth: width(9.525),
    actions: [
      Image.asset(
        AppImages.logoImage,
      ),
    ],
    centerTitle: true,
    toolbarHeight: heigth(8.22),
  );
}
