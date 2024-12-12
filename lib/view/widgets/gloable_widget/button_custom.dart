import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';

class ButtonCustom extends StatelessWidget {
  final double? width, height;
  final String text;
  final Color? color;
  final double? borderRadius;
  final Color? textColor;
  final Function()? onTap;
  final double? textSize;
  final FontWeight? fontWeight;
  const ButtonCustom({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.color,
    this.borderRadius = 5,
    this.textColor,
    this.onTap,
    this.textSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? Get.width,
        height: height ?? Get.height / 20,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color ?? AppColor.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? AppColor.whiteColor,
              fontWeight: fontWeight,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
