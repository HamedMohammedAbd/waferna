import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final bool? focus, isEdit;
  final Widget? suffix;
  final void Function(String)? onChanged;
  const SearchTextField({
    super.key,
    required this.controller,
    this.hint,
    this.suffix,
    this.onChanged,
    this.focus,
    this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: AppColor.primaryColor,
      showCursor: focus,
      readOnly: isEdit ?? false,
      decoration: InputDecoration(
        suffix: suffix,
        filled: true,
        fillColor: AppColor.fillColor1,
        hintText: hint ?? "search".tr,
        hintStyle: TextStyle(
          color: AppColor.hintColor,
          fontSize: AppFontSize.size13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
