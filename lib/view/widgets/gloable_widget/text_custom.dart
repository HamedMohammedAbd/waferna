// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? textSize;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  const TextCustom({
    super.key,
    required this.text,
    this.textColor = AppColor.blackColor,
    this.textSize,
    this.fontWeight = FontWeight.w400,
    this.decoration,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: textSize ?? AppFontSize.size15,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
