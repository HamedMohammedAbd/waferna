import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';
import 'package:waferna/view/widgets/home_widget/home_app_bar.dart';

class WaitingListPage extends StatelessWidget {
  const WaitingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(
        title: "waitList".tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          width(18.143),
        ),
        child: Column(
          children: [
            SizedBox(
              height: heigth(11.58),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: AppColor.waitingListCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(
                            text: "مكيفات",
                            textColor: AppColor.primaryColor,
                            textSize: AppFontSize.size20,
                          ),
                          TextCustom(
                            text: "(15)",
                            textColor: AppColor.primaryColor,
                            textSize: AppFontSize.size20,
                          ),
                        ],
                      ),
                      FittedBox(
                        child: TextCustom(
                          text: "طلبات الانتظار على مكيفات ",
                          textSize: AppFontSize.size10,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
