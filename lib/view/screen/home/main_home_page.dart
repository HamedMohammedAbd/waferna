import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../../controller/home_controller/main_home_controller.dart';
import '../../widgets/home_widget/catagory_card_widget.dart';
import '../../widgets/home_widget/search_text_field.dart';

class MainHomePage extends GetView<MainHomeControllerImp> {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeControllerImp());
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: width(13.138),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(
            controller: controller.searchController,
          ),
          SizedBox(
            height: heigth(29.357143),
          ),
          Row(
            children: [
              TextCustom(
                text: "hello".tr,
                textSize: AppFontSize.size20,
              ),
              SizedBox(
                width: width(50),
              ),
              Image.asset(
                AppImages.hiImage,
              ),
            ],
          ),
          TextCustom(
            text: "buyE".tr,
            textSize: AppFontSize.size20,
          ),
          SizedBox(
            height: heigth(80),
          ),
          CatagoryCardWidget(
            onTap: () => controller.goToCategoryDetailsPage(),
            name: "ملابس",
          ),
        ],
      ),
    );
  }
}
