import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/constant/app_images.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';

import '../../../core/constant/app_color.dart';
import '../gloable_widget/text_custom.dart';

class StackImage extends StatelessWidget {
  final void Function()? onTap;
  final String? name;
  final XFile? image;
  const StackImage({
    super.key,
    this.onTap,
    this.name,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: width(9.07143),
              backgroundColor: AppColor.primaryColor,
              child: CircleAvatar(
                radius: width(10.07143),
                backgroundImage: image == null
                    ? const AssetImage(
                        AppImages.buyerImage,
                      )
                    : FileImage(
                        File(
                          image!.path,
                        ),
                      ),
              ),
            ),
            PositionedDirectional(
              bottom: width(43),
              child: InkWell(
                onTap: onTap,
                child: Container(
                  height: width(17),
                  width: width(17),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(
                      width(130),
                    ),
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColor.whiteColor,
                      size: width(35),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: heigth(50),
        ),
        name != null
            ? TextCustom(
                text: "$name",
                fontWeight: FontWeight.bold,
                textSize: AppFontSize.size25,
              )
            : Container(),
      ],
    );
  }
}
