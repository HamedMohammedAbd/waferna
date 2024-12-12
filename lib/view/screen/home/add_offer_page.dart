import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/button_custom.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';
import 'package:waferna/view/widgets/home_widget/home_app_bar.dart';
import 'package:waferna/view/widgets/home_widget/search_text_field.dart';

import '../../../controller/home_controller/add_offer_page_controller.dart';
import '../../../core/constant/app_color.dart';
import '../../widgets/home_widget/choose_image_widget.dart';
import '../../widgets/home_widget/file_image_design.dart';

class AddOfferPage extends GetView<AddOfferPageControllerImp> {
  const AddOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddOfferPageControllerImp());
    return Scaffold(
      appBar: homeAppBar(
        title: "addNewOffers".tr,
        isSetting: false,
        heightMarging: heigth(21),
        widthMargin: width(80),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: width(6.245),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustom(
              text: "${"ProductName".tr} :",
              textSize: AppFontSize.size18,
            ),
            SizedBox(
              height: heigth(100),
            ),
            SearchTextField(
              controller: controller.productNameController,
              hint: "ProductName".tr,
            ),
            SizedBox(
              height: heigth(100),
            ),
            TextCustom(
              text: "${"ItemType".tr} :",
              textSize: AppFontSize.size18,
            ),
            SizedBox(
              height: heigth(100),
            ),
            SearchTextField(
              controller: controller.productTypeController,
              hint: "ItemType".tr,
              suffix: GetBuilder<AddOfferPageControllerImp>(
                builder: (controller) {
                  return IconButton(
                    onPressed: () => controller.isJopType(),
                    icon: !controller.isType
                        ? const Icon(Icons.arrow_left_rounded)
                        : const Icon(
                            Icons.arrow_drop_down,
                            color: AppColor.primaryColor,
                          ),
                  );
                },
              ),
            ),
            GetBuilder<AddOfferPageControllerImp>(
              builder: (controller) {
                return controller.isType
                    ? SizedBox(
                        height: heigth(5),
                        child: ListView(
                          children: [
                            ...List.generate(
                              controller.jopTypeList.length,
                              (index) {
                                return ListTile(
                                  onTap: () =>
                                      controller.chooseUserJopType(index),
                                  title: TextCustom(
                                    text: controller.jopTypeList[index],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    : Container();
              },
            ),
            SizedBox(
              height: heigth(100),
            ),
            TextCustom(
              text: "${"location".tr} :",
              textSize: AppFontSize.size18,
            ),
            SizedBox(
              height: heigth(100),
            ),
            SearchTextField(
              controller: controller.locationController,
              hint: "location".tr,
            ),
            SizedBox(
              height: heigth(100),
            ),
            TextCustom(
              text: "${"imageItem".tr} :",
              textSize: AppFontSize.size18,
            ),
            SizedBox(
              height: heigth(100),
            ),
            GetBuilder<AddOfferPageControllerImp>(
              builder: (controller) {
                return Wrap(
                  children: [
                    ...List.generate(
                      controller.carImage!.length,
                      (index) {
                        return Container(
                          margin: EdgeInsets.all(Get.width / 30),
                          child: FileImageDesign(
                            height: Get.width / 6.262,
                            width: Get.width / 6.262,
                            image: controller.carImage![index],
                          ),
                        );
                      },
                    ),
                    ChooseImageWidget(
                      onTap: () => controller.chooseCarImage(),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: heigth(100),
            ),
            TextCustom(
              text: "${"ItemDescription".tr} :",
              textSize: AppFontSize.size18,
            ),
            SizedBox(
              height: heigth(100),
            ),
            SearchTextField(
              controller: controller.itemDescriptionController,
              hint: "ItemDescription".tr,
            ),
            SizedBox(
              height: heigth(100),
            ),
            TextCustom(
              text: "${"Itemprice".tr} :",
              textSize: AppFontSize.size18,
            ),
            SizedBox(
              height: heigth(100),
            ),
            SearchTextField(
              controller: controller.itemDescriptionController,
              hint: "Itemprice".tr,
            ),
            SizedBox(
              height: heigth(100),
            ),
            TextCustom(
              text: "${"AddContactNumber".tr} :",
              textSize: AppFontSize.size18,
            ),
            SizedBox(
              height: heigth(100),
            ),
            SearchTextField(
              controller: controller.itemDescriptionController,
              hint: "AddContactNumber".tr,
            ),
            SizedBox(
              height: heigth(50),
            ),
            ButtonCustom(
              text: "PublishNow".tr,
              onTap: () {},
            ),
            SizedBox(
              height: heigth(50),
            ),
          ],
        ),
      ),
    );
  }
}
