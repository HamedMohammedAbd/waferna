import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/function/storage_user_data.dart';
import 'package:waferna/view/widgets/home_widget/stack_image.dart';

import '../../../controller/peronal_pages/personal_information_page_controller.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/function/height.dart';
import '../../../core/function/logout.dart';
import '../../../core/function/validation_function.dart';
import '../../../core/function/width.dart';
import '../../widgets/auth_widget/app_bar_widget.dart';
import '../../widgets/gloable_widget/button_custom.dart';
import '../../widgets/gloable_widget/text_custom.dart';
import '../../widgets/gloable_widget/text_form_custom.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PersonalInformationPageControllerImp());
    return Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          width(12),
        ),
        child: GetBuilder<PersonalInformationPageControllerImp>(
            builder: (controller) {
          return Form(
            key: controller.formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetBuilder<PersonalInformationPageControllerImp>(
                  builder: (controller) {
                    return StackImage(
                      isChangeImage: !controller.isEdit,
                      image: dataStorage().imageUrl,
                      onTap: () => controller.uploadImage(),
                      imageFile: controller.image,
                    );
                  },
                ),
                TextFormWithLabel(
                  hint: "",
                  label: "fullName",
                  textEditingController: controller.fullNameController,
                  readOnly: controller.isEdit,
                  validation: (String? value) {
                    return validationFunction(
                      value: value!,
                      min: 10,
                      max: 40,
                      type: 'name',
                    );
                  },
                ),
                SizedBox(
                  height: heigth(51.375),
                ),
                TextFormWithLabel(
                  hint: "",
                  label: "phoneNumber",
                  textEditingController: controller.phoneNumberController,
                  readOnly: controller.isEdit,
                  validation: (String? value) {
                    return validationFunction(
                      value: value!,
                      min: 10,
                      max: 15,
                      type: 'phone',
                    );
                  },
                ),
                SizedBox(
                  height: heigth(51.375),
                ),
                TextFormWithLabel(
                  hint: "",
                  label: "email".tr,
                  textEditingController: controller.emailController,
                  readOnly: controller.isEdit,
                  validation: (String? value) {
                    return validationFunction(
                      value: value!,
                      min: 10,
                      max: 100,
                      type: 'email',
                    );
                  },
                ),
                SizedBox(
                  height: heigth(51.375),
                ),
                controller.userType != "customer"
                    ? Column(
                        children: [
                          SizedBox(
                            height: heigth(51.375),
                          ),
                          TextFormWithLabel(
                            hint: "",
                            label: "DealerNumber",
                            textEditingController:
                                controller.dealerNumberController,
                            readOnly: controller.isEdit,
                            validation: (String? value) {
                              return validationFunction(
                                value: value!,
                                min: 15,
                                max: 15,
                                type: '',
                              );
                            },
                          ),
                          SizedBox(
                            height: heigth(51.375),
                          ),
                          TextFormWithLabel(
                            hint: "",
                            label: "MerchantActivity",
                            textEditingController:
                                controller.merchantActivityController,
                            readOnly: controller.isEdit,
                            validation: (String? value) {
                              return validationFunction(
                                value: value!,
                                min: 10,
                                max: 200,
                                type: 'name',
                              );
                            },
                          ),
                          SizedBox(
                            height: heigth(51.375),
                          ),
                          TextFormWithLabel(
                            hint: "",
                            label: "TypeOfWork",
                            textEditingController:
                                controller.typeOfWorkController,
                            readOnly: true,
                            validation: (String? value) {
                              return validationFunction(
                                value: value!,
                                min: 3,
                                max: 40,
                                type: '',
                              );
                            },
                            suffix: !controller.isEdit ||
                                    controller.upgrade != ""
                                ? GetBuilder<
                                    PersonalInformationPageControllerImp>(
                                    builder: (controller) {
                                      return IconButton(
                                        onPressed: () => controller.isJopType(),
                                        icon: !controller.isType
                                            ? const Icon(
                                                Icons.arrow_left_rounded)
                                            : const Icon(
                                                Icons.arrow_drop_down,
                                                color: AppColor.primaryColor,
                                              ),
                                      );
                                    },
                                  )
                                : null,
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
                    : Container(),
                SizedBox(
                  height: heigth(51.375 / 2),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 17,
                      child: ButtonCustom(
                        text: "logout".tr,
                        textSize: AppFontSize.size25,
                        height: heigth(16.44),
                        onTap: () {
                          logout();
                        },
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: GetBuilder<PersonalInformationPageControllerImp>(
                        builder: (controller) {
                          return ButtonCustom(
                            text: controller.upgrade != ""
                                ? "upgrade".tr
                                : controller.isEdit
                                    ? "Edit".tr
                                    : "save".tr,
                            height: heigth(16.44),
                            onTap: () => controller.upgrade != ""
                                ? controller.saveNewDataWithImage()
                                : controller.isEdit
                                    ? controller.editData()
                                    : controller.image != null
                                        ? controller.saveNewDataWithImage()
                                        : controller.saveNewDataWithImage(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
