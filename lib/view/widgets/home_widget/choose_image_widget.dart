import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/function/width.dart';

import '../../../../core/constant/app_color.dart';

class ChooseImageWidget extends StatelessWidget {
  final void Function()? onTap;
  const ChooseImageWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        Get.width / 30,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: Get.width / 6.262,
          width: Get.width / 6.262,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: AppColor.primaryColor,
            ),
          ),
          child: Icon(
            Icons.image_outlined,
            size: width(25),
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
