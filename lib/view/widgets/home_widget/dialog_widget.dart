import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../gloable_widget/text_custom.dart';
import 'settings_buttons_widget.dart';

class DialogWidget extends StatelessWidget {
  final List data;
  const DialogWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextCustom(
          text: "Settings".tr,
          fontWeight: FontWeight.bold,
          textSize: AppFontSize.size22,
        ),
        Container(
          height: 2,
          color: AppColor.blackColor,
          width: width(1),
          margin: EdgeInsets.symmetric(
            horizontal: width(
              20,
            ),
            vertical: heigth(50),
          ),
        ),
        SizedBox(
          height: heigth(15) - heigth(50),
        ),
        ...List.generate(
          data.length,
          (index) {
            String name = data[index]["name"];
            return SettingsButtonsWidget(
              buttonName: name,
              onTap: data[index]["onTap"],
            );
          },
        ),
        SizedBox(
          height: heigth(80),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => Get.back(),
              child: TextCustom(
                text: "close".tr,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
