import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../../controller/auth_controller/sign_up_controller.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../../widgets/auth_widget/app_bar_widget.dart';
import '../../widgets/gloable_widget/button_custom.dart';
import '../../widgets/gloable_widget/text_form_custom.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: appBarWidget(
        onTap: () => controller.backPage(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          width(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<SignUpControllerImp>(
              builder: (controller) {
                return Image.asset(
                  controller.userType != "Dealer"
                      ? AppImages.buyerImage
                      : AppImages.dealerImage,
                  width: width(2),
                  height: width(3),
                );
              },
            ),
            GetBuilder<SignUpControllerImp>(
              builder: (controller) {
                return Row(
                  children: [
                    Radio(
                      value: "Buyer",
                      groupValue: controller.userType,
                      onChanged: (value) => controller.changeUserType("Buyer"),
                    ),
                    TextCustom(
                      text: "Buyer".tr,
                    ),
                    Radio(
                      value: "Dealer",
                      groupValue: controller.userType,
                      onChanged: (value) => controller.changeUserType("Dealer"),
                    ),
                    TextCustom(
                      text: "Dealer".tr,
                    ),
                  ],
                );
              },
            ),
            TextFormWithLabel(
              hint: "nameHint".tr,
              label: "fullName",
              textEditingController: controller.phoneNumberController,
            ),
            SizedBox(
              height: heigth(51.375),
            ),
            TextFormWithLabel(
              hint: "+9999999978",
              label: "phoneNumber",
              textEditingController: controller.phoneNumberController,
            ),
            SizedBox(
              height: heigth(51.375),
            ),
            TextFormWithLabel(
              hint: "**************",
              label: "password",
              textEditingController: controller.passwordController,
              isPassword: true,
            ),
            SizedBox(
              height: heigth(51.375),
            ),
            TextFormWithLabel(
              hint: "**************",
              label: "confirmPassword",
              textEditingController: controller.confirmPasswordController,
              isPassword: true,
            ),
            GetBuilder<SignUpControllerImp>(
              builder: (controller) {
                return controller.userType == "Dealer"
                    ? Column(
                        children: [
                          SizedBox(
                            height: heigth(51.375),
                          ),
                          TextFormWithLabel(
                            hint: "57675***",
                            label: "DealerNumber",
                            textEditingController:
                                controller.dealerNumberController,
                          ),
                          SizedBox(
                            height: heigth(51.375),
                          ),
                          TextFormWithLabel(
                            hint: "JobDescription".tr,
                            label: "MerchantActivity",
                            textEditingController:
                                controller.merchantActivityController,
                          ),
                          SizedBox(
                            height: heigth(51.375),
                          ),
                          TextFormWithLabel(
                            hint: "",
                            label: "TypeOfWork",
                            textEditingController:
                                controller.typeOfWorkController,
                            suffix: GetBuilder<SignUpControllerImp>(
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
                          controller.isType
                              ? SizedBox(
                                  height: heigth(5),
                                  child: ListView(
                                    children: [
                                      ...List.generate(
                                        controller.jopTypeList.length,
                                        (index) {
                                          return ListTile(
                                            onTap: () => controller
                                                .chooseUserJopType(index),
                                            title: TextCustom(
                                              text:
                                                  controller.jopTypeList[index],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      )
                    : Container();
              },
            ),
            SizedBox(
              height: heigth(51.375 / 2),
            ),
            ButtonCustom(
              text: "next".tr,
              textSize: AppFontSize.size25,
              height: heigth(16.44),
            ),
          ],
        ),
      ),
    );
  }
}
