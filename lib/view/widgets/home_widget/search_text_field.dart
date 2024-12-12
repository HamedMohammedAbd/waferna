import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final Widget? suffix;
  const SearchTextField({
    super.key,
    required this.controller,
    this.hint,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffix,
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
