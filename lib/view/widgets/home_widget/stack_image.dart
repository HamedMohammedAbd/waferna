import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';

import '../../../core/constant/app_color.dart';
import '../gloable_widget/text_custom.dart';

class StackImage extends StatelessWidget {
  final void Function()? onTap;
  final String? name;
  final String? image;
  final bool? isChangeImage;
  final XFile? imageFile;

  const StackImage({
    super.key,
    this.onTap,
    this.name,
    this.image,
    this.isChangeImage,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: width(9.07143),
              backgroundColor: AppColor.primaryColor,
              child: CircleAvatar(
                radius: width(10.07143),
                child: imageFile == null
                    ? image!.substring(image!.length - 4, image!.length) ==
                            ".svg"
                        ? ClipOval(
                            child: SvgPicture.network(
                              image!,
                              width: width(10.07143 / 2),
                              height: width(10.07143 / 2),
                            ),
                          )
                        : ClipOval(
                            child: Image(
                              width: width(10.07143 / 2),
                              height: width(10.07143 / 2),
                              image: NetworkImage(image!),
                              fit: BoxFit.fill,
                            ),
                          )
                    : ClipOval(
                        child: Image(
                          image: FileImage(
                            File(
                              imageFile!.path,
                            ),
                          ),
                          fit: BoxFit.fill,
                          width: width(10.07143 / 2),
                          height: width(10.07143 / 2),
                        ),
                      ),
              ),
            ),
            isChangeImage == true
                ? PositionedDirectional(
                    bottom: 0,
                    start: 0,
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
                  )
                : Container(),
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
