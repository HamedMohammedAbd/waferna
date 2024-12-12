import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/core/constant/app_routes.dart';

import '../services/my_service.dart';

abstract class OnBoardingController extends GetxController {
  skipOnBoarding();
  nextPage();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentIndex = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  List<Map<String, String>> onBoardingPages = [
    {
      "image": AppImages.onBoardingOne,
      "text": "onBoardingOne".tr,
    },
    {
      "image": AppImages.onBoardingTwo,
      "text": "onBoardingTwo".tr,
    },
    {
      "image": AppImages.onBoardingThree,
      "text": "onBoardingThree".tr,
    },
  ];
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  skipOnBoarding() {
    Get.offAllNamed(AppRoutes.chooseLoginPage);
    myServices.sharedPreferences.setString(
      "step",
      "1",
    );
  }

  @override
  nextPage() {
    currentIndex++;

    if (currentIndex != onBoardingPages.length) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    } else {
      skipOnBoarding();
    }
  }

  @override
  onPageChanged(int index) {
    currentIndex = index;
    update();
  }
}
