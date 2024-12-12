import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/button_custom.dart';

import '../../controller/choose_login_page_controller.dart';

class ChooseLoginPage extends StatelessWidget {
  const ChooseLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseLoginPageControllerImp controller =
        Get.put(ChooseLoginPageControllerImp());
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    color: AppColor.whiteColor,
                  ),
                  child: Image.asset(AppImages.logoImage),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: -10,
            bottom: heigth(22),
            child: CircleAvatar(
              radius: width(1.9),
              backgroundColor: AppColor.primaryColor,
            ),
          ),
          Positioned(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                horizontal: width(9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonCustom(
                    color: AppColor.whiteColor,
                    text: "login".tr,
                    textColor: AppColor.blackColor,
                    textSize: AppFontSize.size22,
                    height: heigth(16.1),
                    onTap: () => controller.loginPage(),
                  ),
                  SizedBox(
                    height: heigth(40),
                  ),
                  ButtonCustom(
                    color: AppColor.whiteColor,
                    text: "createAccount".tr,
                    textColor: AppColor.blackColor,
                    textSize: AppFontSize.size22,
                    height: heigth(16.1),
                    onTap: () => controller.createAccount(),
                  ),
                  SizedBox(
                    height: heigth(40),
                  ),
                  Center(
                    child: SizedBox(
                      width: width(3.5),
                      child: ButtonCustom(
                        height: heigth(29.3572),
                        color: AppColor.whiteColor.withOpacity(0.4),
                        text: "vist".tr,
                        textColor: AppColor.whiteColor,
                        textSize: AppFontSize.size15,
                        onTap: () => controller.vistor(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heigth(8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
