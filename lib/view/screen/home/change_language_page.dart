import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/controller/home_controller/nav_home_controller.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';
import 'package:waferna/view/widgets/home_widget/home_app_bar.dart';

import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../../../localization/change_local_controller.dart';

class ChangeLanguagePage extends GetView<ChangeLocaleController> {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangeLocaleController());
    return Scaffold(
      appBar: homeAppBar(
        title: "changeLanguage".tr,
        isSetting: false,
        heightMarging: heigth(21),
        widthMargin: width(80),
        onTap: () {
          Get.put(NavHomeControllerImp());

          Get.back();
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            width(15),
          ),
          child: Column(
            children: [
              Image.asset(
                AppImages.languageImage,
                color: AppColor.primaryColor,
                width: width(3),
              ),
              SizedBox(
                height: heigth(15),
              ),
              InkWell(
                onTap: () {
                  controller.changeLanguageUser("ar");
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(
                      width(20),
                    ),
                    width: width(1),
                    height: heigth(7),
                    child: Row(
                      children: [
                        TextCustom(
                          text: "العربية",
                          fontWeight: FontWeight.bold,
                          textSize: AppFontSize.size25,
                          textColor: AppColor.primaryColor,
                        ),
                        const Spacer(),
                        const TextCustom(
                          text: "A",
                          textColor: AppColor.blackColor,
                          textSize: 55,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.changeLanguageUser("en");
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(
                      width(20),
                    ),
                    width: width(1),
                    height: heigth(7),
                    child: Row(
                      children: [
                        TextCustom(
                          text: "English",
                          fontWeight: FontWeight.bold,
                          textSize: AppFontSize.size25,
                          textColor: AppColor.primaryColor,
                        ),
                        const Spacer(),
                        const TextCustom(
                          text: "E",
                          textColor: AppColor.blackColor,
                          textSize: 55,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heigth(15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
