import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';

class TextFormCustom extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String? value)? validation;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final bool? readOnly;

  const TextFormCustom({
    super.key,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    required this.validation,
    this.suffix,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validation,
      cursorColor: AppColor.primaryColor,
      obscureText: isPassword,
      readOnly: readOnly!,
      decoration: InputDecoration(
        focusColor: AppColor.primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColor.textFormColor,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: Get.width / 20,
        ),
        hintText: hint,
        suffixIcon: suffix,
        hintStyle: const TextStyle(
          color: AppColor.hintColor,
        ),
      ),
    );
  }
}
