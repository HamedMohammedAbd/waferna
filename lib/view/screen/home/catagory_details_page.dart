import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/back_icon_button.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';
import 'package:waferna/view/widgets/home_widget/search_text_field.dart';

import '../../../controller/home_controller/category_details_page_controller.dart';
import '../../widgets/home_widget/home_app_bar.dart';
import '../../widgets/home_widget/products_card_details.dart';

class CatagoryDetailsPage extends GetView<CategoryDetailsPageControllerImp> {
  const CatagoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryDetailsPageControllerImp());
    return Scaffold(
      appBar: homeAppBar(
        title: controller.title,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: width(15.24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BackIconButton(),
                SizedBox(
                  width: width(40),
                ),
                Expanded(
                  child: SearchTextField(
                    controller: controller.searchCategoryController,
                  ),
                ),
                SizedBox(
                  width: width(20),
                ),
              ],
            ),
            SizedBox(
              height: width(40),
            ),
            TextCustom(
              text: "Choosewhatsuits".tr,
              textSize: AppFontSize.size20,
            ),
            SizedBox(
              height: width(40),
            ),
            GetBuilder<CategoryDetailsPageControllerImp>(
              builder: (controller) {
                return Column(
                  children: [
                    ...List.generate(
                      controller.products.length,
                      (index) {
                        return ProductsCardDetails(
                          description: controller.products[index].description!,
                          location: controller.products[index].place!,
                          title: controller.products[index].name!,
                          imageUrl: controller.products[index].coverImageUrl!,
                          price: "${controller.products[index].price!}",
                        );
                      },
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
