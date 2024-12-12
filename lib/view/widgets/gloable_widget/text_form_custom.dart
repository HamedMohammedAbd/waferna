import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_font_size.dart';

import 'text_custom.dart';
import 'text_form_custom_without_label.dart';

class TextFormWithLabel extends StatelessWidget {
  final String label, hint;
  final TextEditingController textEditingController;
  final String? Function(String?)? validation;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final bool isPassword;
  const TextFormWithLabel({
    super.key,
    required this.label,
    required this.hint,
    required this.textEditingController,
    this.validation,
    this.suffix,
    this.onChanged,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextCustom(
          text: "${label.tr} : ",
          textSize: AppFontSize.size18,
        ),
        SizedBox(
          height: Get.height / 90,
        ),
        TextFormCustom(
          hint: hint,
          controller: textEditingController,
          validation: validation,
          suffix: suffix,
          onChanged: onChanged,
          isPassword: isPassword,
        ),
      ],
    );
  }
}
