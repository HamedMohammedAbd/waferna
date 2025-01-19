import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/peronal_pages/set_password_page_controller.dart';
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

class SetPasswordPage extends GetView<SetPasswordPageControllerImp> {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SetPasswordPageControllerImp());
    return Scaffold(
      appBar: appBarWidget(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width(13.138),
          ),
          child: Column(
            children: [
              TextCustom(
                text: "SetPassword".tr,
                textSize: AppFontSize.size20,
              ),
              SizedBox(
                height: heigth(15),
              ),
              Image.asset(
                AppImages.resetPassword,
                width: width(2.4423),
                height: width(2.4423),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: heigth(51.375),
              ),
              TextCustom(
                text: "GoodPassword".tr,
                textSize: AppFontSize.size20,
                textColor: AppColor.hintColor,
              ),
              SizedBox(
                height: heigth(30.375),
              ),
              TextFormWithLabel(
                hint: "***********",
                label: "newPassword",
                textEditingController: controller.newPasswordController,
                validation: (String? value) {
                  return validationFunction(
                    value: value!,
                    min: 8,
                    max: 150,
                    type: '',
                  );
                },
              ),
              SizedBox(
                height: heigth(51.375 / 2),
              ),
              TextFormWithLabel(
                hint: "**********",
                label: "confirmPassword",
                textEditingController: controller.confirmPasswordController,
                validation: (String? value) {
                  return validationFunction(
                    value: value!,
                    min: 8,
                    max: 150,
                    type: '',
                  );
                },
              ),
              SizedBox(
                height: heigth(51.375 / 2),
              ),
              ButtonCustom(
                text: "next".tr,
                textSize: AppFontSize.size25,
                height: heigth(16.44),
                onTap: () => controller.saveNewPassword(),
              ),
              SizedBox(
                height: heigth(5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
