import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:waferna/view/widgets/auth_widget/app_bar_widget.dart';

import '../../../controller/peronal_pages/verify_phone_number_controller.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../../widgets/gloable_widget/button_custom.dart';
import '../../widgets/gloable_widget/text_custom.dart';

class VerifyPhoneNumber extends GetView<VerifyPhoneNumberControllerImp> {
  const VerifyPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyPhoneNumberControllerImp());
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
                text: "VerifyPhoneNumber".tr,
                textSize: AppFontSize.size20,
              ),
              SizedBox(
                height: heigth(7),
              ),
              Image.asset(
                AppImages.resetPasswordVerify,
                width: width(2.4423),
                height: width(2.4423),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: heigth(51.375),
              ),
              TextCustom(
                text: "EnterCode".tr,
                textSize: AppFontSize.size15,
                textColor: AppColor.hintColor,
              ),
              TextCustom(
                text: "34567****",
                textSize: AppFontSize.size15,
                textColor: AppColor.hintColor,
              ),
              SizedBox(
                height: heigth(30.375),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: OtpTextField(
                  numberOfFields: 4,
                  borderColor: AppColor.textFormColor,
                  cursorColor: AppColor.primaryColor,
                  focusedBorderColor: AppColor.primaryColor,
                  enabledBorderColor: AppColor.textFormColor,
                  showFieldAsBox: true,
                  onSubmit: (String verificationCode) {
                    // controller.verification(verificationCode);
                  },
                ),
              ),
              SizedBox(
                height: heigth(30),
              ),
              ButtonCustom(
                text: "Verified".tr,
                textSize: AppFontSize.size25,
                height: heigth(16.44),
                onTap: () => controller.verifyCode(),
              ),
              SizedBox(
                height: heigth(51.375 / 2),
              ),
              TextCustom(
                text: "NotReceiveCode".tr,
                textSize: AppFontSize.size13,
              ),
              TextButton(
                onPressed: () => controller.resentVerifyCode(),
                child: TextCustom(
                  text: "Resend".tr,
                  textSize: AppFontSize.size13,
                  textColor: AppColor.primaryColor,
                ),
              ),
              SizedBox(
                height: heigth(25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
