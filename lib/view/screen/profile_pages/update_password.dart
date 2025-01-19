import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/peronal_pages/update_password_controller.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/function/height.dart';
import '../../../core/function/validation_function.dart';
import '../../../core/function/width.dart';
import '../../widgets/auth_widget/app_bar_widget.dart';
import '../../widgets/gloable_widget/button_custom.dart';
import '../../widgets/gloable_widget/text_custom.dart';
import '../../widgets/gloable_widget/text_form_custom.dart';

class UpdatePassword extends GetView<UpdatePasswordControllerImp> {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdatePasswordControllerImp());
    return Scaffold(
      appBar: appBarWidget(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width(13.138),
          ),
          child: Column(
            spacing: heigth(51.375 / 1.5),
            children: [
              TextCustom(
                text: "updatePassword".tr,
                textSize: AppFontSize.size20,
              ),
              Image.asset(
                AppImages.resetPassword,
                width: width(2.4423),
                height: width(2.4423),
                fit: BoxFit.cover,
              ),
              TextCustom(
                text: "GoodPassword".tr,
                textSize: AppFontSize.size20,
                textColor: AppColor.hintColor,
                textAlign: TextAlign.center,
              ),
              TextFormWithLabel(
                hint: "***********",
                label: "oldPassword",
                textEditingController: controller.oldPasswordController,
                isPassword: true,
                validation: (String? value) {
                  return validationFunction(
                    value: value!,
                    min: 8,
                    max: 150,
                    type: '',
                  );
                },
              ),
              TextFormWithLabel(
                hint: "***********",
                label: "newPassword",
                textEditingController: controller.newPasswordController,
                isPassword: true,
                validation: (String? value) {
                  return validationFunction(
                    value: value!,
                    min: 8,
                    max: 150,
                    type: '',
                  );
                },
              ),
              TextFormWithLabel(
                hint: "**********",
                label: "confirmPassword",
                textEditingController: controller.confirmPasswordController,
                isPassword: true,
                validation: (String? value) {
                  return validationFunction(
                    value: value!,
                    min: 8,
                    max: 150,
                    type: '',
                  );
                },
              ),
              ButtonCustom(
                text: "update".tr,
                textSize: AppFontSize.size25,
                height: heigth(16.44),
                onTap: () => controller.updatePassword(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
