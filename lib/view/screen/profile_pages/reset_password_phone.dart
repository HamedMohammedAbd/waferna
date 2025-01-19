import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/auth_widget/app_bar_widget.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../../controller/peronal_pages/restet_password_phone_controller.dart';
import '../../../core/function/validation_function.dart';
import '../../widgets/gloable_widget/button_custom.dart';
import '../../widgets/gloable_widget/text_form_custom.dart';

class ResetPasswordPhone extends GetView<RestetPasswordPhoneControllerImp> {
  const ResetPasswordPhone({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RestetPasswordPhoneControllerImp());
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
                text: "ResetPassword".tr,
                textSize: AppFontSize.size20,
              ),
              SizedBox(
                height: heigth(5),
              ),
              Image.asset(
                AppImages.resetPasswordOne,
                width: width(2.4423),
                height: width(2.4423),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: heigth(51.375),
              ),
              TextCustom(
                text: "email".tr,
                textSize: AppFontSize.size20,
                textColor: AppColor.hintColor,
              ),
              SizedBox(
                height: heigth(30.375),
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
              SizedBox(
                height: heigth(51.375 / 2),
              ),
              ButtonCustom(
                text: "next".tr,
                textSize: AppFontSize.size25,
                height: heigth(16.44),
                onTap: () => controller.nextPage(),
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
