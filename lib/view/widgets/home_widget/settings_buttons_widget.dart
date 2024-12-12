import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../gloable_widget/text_custom.dart';

class SettingsButtonsWidget extends StatelessWidget {
  final void Function()? onTap;
  final String buttonName;
  const SettingsButtonsWidget({
    super.key,
    this.onTap,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: heigth(71.4783),
        ),
        alignment: Alignment.center,
        width: width(3),
        height: heigth(19.1163),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurStyle: BlurStyle.outer,
              offset: Offset(-5, 5),
              color: AppColor.redShadowColor,
            ),
          ],
        ),
        child: FittedBox(
          child: TextCustom(
            text: buttonName.tr,
            textColor: AppColor.whiteColor,
            textSize: AppFontSize.size18,
          ),
        ),
      ),
    );
  }
}
