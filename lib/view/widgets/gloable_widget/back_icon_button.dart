import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';

class BackIconButton extends StatelessWidget {
  final void Function()? onTap;
  final double? heightMargin, widthMargin;

  const BackIconButton({
    super.key,
    this.onTap,
    this.heightMargin,
    this.widthMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(11.9),
      height: heigth(34.25),
      padding: const EdgeInsets.all(2),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: widthMargin ?? width(40),
        vertical: heightMargin ?? width(25),
      ),
      decoration: BoxDecoration(
        color: AppColor.hintColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap ?? () => Get.back(),
        child: const FittedBox(
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
