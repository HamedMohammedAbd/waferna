import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/view/widgets/gloable_widget/button_custom.dart';

import '../../../controller/home_controller/waiting_order_page_controller.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../../widgets/gloable_widget/text_custom.dart';
import '../../widgets/home_widget/home_app_bar.dart';
import '../../widgets/home_widget/search_text_field.dart';

class WaitingOrderPage extends GetView<WaitingOrderPageControllerImp> {
  const WaitingOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WaitingOrderPageControllerImp());
    return Scaffold(
      appBar: homeAppBar(
        title: "ProductWaitingRequest".tr,
        isSetting: false,
        heightMarging: heigth(21),
        widthMargin: width(80),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: width(16.245),
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
              suffix: GetBuilder<WaitingOrderPageControllerImp>(
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
            GetBuilder<WaitingOrderPageControllerImp>(
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
              height: heigth(20),
            ),
            Row(
              children: [
                ButtonCustom(
                  width: width(5.536),
                  height: heigth(21.077),
                  text: "+",
                  textSize: 50,
                  onTap: () => controller.addDay(),
                  borderRadius: 25,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                GetBuilder<WaitingOrderPageControllerImp>(
                  builder: (controller) {
                    return ButtonCustom(
                      width: width(2.865),
                      height: heigth(21.077),
                      text: "${"day".tr} : ${controller.dayWait}",
                      textSize: 50,
                      borderRadius: 25,
                    );
                  },
                ),
                const Spacer(),
                ButtonCustom(
                  width: width(5.536),
                  height: heigth(21.077),
                  text: "-",
                  textSize: 50,
                  onTap: () => controller.removeDay(),
                  borderRadius: 25,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: heigth(20),
            ),
            Center(
              child: ButtonCustom(
                text: "SubmitRequest".tr,
                width: width(1.524),
                onTap: () => controller.addWaitingOrder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
