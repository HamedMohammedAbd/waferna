import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/button_custom.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../../controller/auth_controller/login_page_controller.dart';
import '../../widgets/auth_widget/app_bar_widget.dart';
import '../../widgets/gloable_widget/text_form_custom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginPageControllerImp controller = Get.put(LoginPageControllerImp());
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
            Image.asset(AppImages.loginPageImage),
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
              height: heigth(51.375 / 2),
            ),
            ButtonCustom(
              text: "login2".tr,
              textSize: AppFontSize.size25,
              height: heigth(16.44),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => controller.forgotPassword(),
                  child: TextCustom(
                    text: "forgotPassword".tr,
                    textSize: AppFontSize.size13,
                  ),
                ),
                TextButton(
                  onPressed: () => controller.createAccount(),
                  child: TextCustom(
                    text: "createAccount".tr,
                    textSize: AppFontSize.size13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
