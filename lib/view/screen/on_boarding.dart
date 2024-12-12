import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';

import '../../controller/on_boarding_controller.dart';
import '../widgets/gloable_widget/button_custom.dart';
import '../widgets/gloable_widget/text_custom.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp controller = Get.put(OnBoardingControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: InkWell(
          onTap: () => controller.skipOnBoarding(),
          child: Container(
            height: heigth(31.6164),
            width: width(5.86154),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.fillColor1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextCustom(
              text: "skip".tr,
              textSize: AppFontSize.size15,
            ),
          ),
        ),
      ),
      body: GetBuilder<OnBoardingControllerImp>(
        builder: (controller) {
          return PageView.builder(
            controller: controller.pageController,
            onPageChanged: (index) => controller.onPageChanged(index),
            itemCount: controller.onBoardingPages.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                          controller.onBoardingPages[index]["image"]!),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        TextCustom(
                          text: controller.onBoardingPages[index]["text"]!,
                          textSize: AppFontSize.size15,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              controller.onBoardingPages.length,
                              (index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width(150),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        controller.currentIndex == index
                                            ? AppColor.primaryColor
                                            : const Color(0xffB9CFDE),
                                    radius: width(95.25),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: heigth(9),
          left: width(10),
          right: width(10),
        ),
        child: ButtonCustom(
          text: "next".tr,
          textSize: AppFontSize.size25,
          fontWeight: FontWeight.w700,
          onTap: () {
            controller.nextPage();
          },
        ),
      ),
    );
  }
}
