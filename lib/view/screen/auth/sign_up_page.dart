import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../../controller/auth_controller/sign_up_controller.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/function/height.dart';
import '../../../core/function/validation_function.dart';
import '../../../core/function/width.dart';
import '../../widgets/auth_widget/app_bar_widget.dart';
import '../../widgets/gloable_widget/button_custom.dart';
import '../../widgets/gloable_widget/text_form_custom.dart';

class SignUpPage extends GetView<SignUpControllerImp> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: appBarWidget(
        onTap: () => controller.backPage(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          width(12),
        ),
        child: Form(
          key: controller.formStateKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: heigth(51.375),
            children: [
              Image.asset(
                AppImages.buyerImage,
                width: width(2),
                height: width(3),
              ),
              GetBuilder<SignUpControllerImp>(
                builder: (controller) {
                  return Row(
                    children: [
                      Radio(
                        value: "Buyer",
                        groupValue: controller.userType,
                        onChanged: (value) =>
                            controller.changeUserType("Buyer"),
                      ),
                      TextCustom(
                        text: "Buyer".tr,
                      ),
                      Radio(
                        value: "Dealer",
                        groupValue: controller.userType,
                        onChanged: (value) =>
                            controller.changeUserType("Dealer"),
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
                textEditingController: controller.fullNameController,
                validation: (String? value) {
                  return validationFunction(
                    value: value!,
                    min: 10,
                    max: 40,
                    type: 'name',
                  );
                },
              ),
              TextFormWithLabel(
                hint: "+9999999978",
                label: "phoneNumber",
                textEditingController: controller.phoneNumberController,
                validation: (String? value) {
                  return validationFunction(
                    value: value!,
                    min: 10,
                    max: 15,
                    type: 'phone',
                  );
                },
              ),
              TextFormWithLabel(
                hint: "email".tr,
                label: "email",
                textEditingController: controller.emailController,
                validation: (String? value) {
                  return validationFunction(
                    value: value!,
                    min: 10,
                    max: 100,
                    type: 'email',
                  );
                },
              ),
              GetBuilder<SignUpControllerImp>(builder: (controller) {
                return controller.upgrade != "upgrade"
                    ? Column(
                        children: [
                          TextFormWithLabel(
                            hint: "**************",
                            label: "password",
                            textEditingController:
                                controller.passwordController,
                            isPassword: true,
                            validation: (String? value) {
                              return validationFunction(
                                value: value!,
                                min: 8,
                                max: 100,
                                type: 'name',
                              );
                            },
                          ),
                          TextFormWithLabel(
                            hint: "**************",
                            label: "confirmPassword",
                            textEditingController:
                                controller.confirmPasswordController,
                            validation: (String? value) {
                              return validationFunction(
                                value: value!,
                                min: 8,
                                max: 100,
                                type: 'name',
                              );
                            },
                            isPassword: true,
                          ),
                        ],
                      )
                    : Container();
              }),
              GetBuilder<SignUpControllerImp>(
                builder: (controller) {
                  return controller.userType == "Dealer"
                      ? Column(
                          spacing: heigth(51.375),
                          children: [
                            TextFormWithLabel(
                              hint: "57675***",
                              label: "DealerNumber",
                              textEditingController:
                                  controller.dealerNumberController,
                              validation: (String? value) {
                                return validationFunction(
                                  value: value!,
                                  min: 15,
                                  max: 15,
                                  type: '',
                                );
                              },
                            ),
                            TextFormWithLabel(
                              hint: "JobDescription".tr,
                              label: "MerchantActivity",
                              textEditingController:
                                  controller.merchantActivityController,
                              validation: (String? value) {
                                return validationFunction(
                                  value: value!,
                                  min: 10,
                                  max: 200,
                                  type: '',
                                );
                              },
                            ),
                            TextFormWithLabel(
                              readOnly: true,
                              hint: "",
                              label: "TypeOfWork",
                              textEditingController:
                                  controller.typeOfWorkController,
                              validation: (String? value) {
                                return validationFunction(
                                  value: value!,
                                  min: 3,
                                  max: 40,
                                  type: '',
                                );
                              },
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
                                                text: controller
                                                    .jopTypeList[index].name!,
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
                onTap: () => controller.signUpUser(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
