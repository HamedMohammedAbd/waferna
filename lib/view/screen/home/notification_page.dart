import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';
import 'package:waferna/view/widgets/home_widget/home_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(
        title: "notification".tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          width(12.7),
        ),
        child: Column(
          children: [
            SizedBox(
              height: heigth(11.42),
              width: width(1),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: width(15.24),
                    backgroundColor: AppColor.primaryColor,
                    child: const Center(
                      child: Icon(
                        Icons.notifications_none,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width(20),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FittedBox(
                        child: TextCustom(
                          text: "*********************",
                        ),
                      ),
                      TextCustom(
                        text: "الان",
                        textColor: AppColor.hintColor,
                        textSize: AppFontSize.size10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
