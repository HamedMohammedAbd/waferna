import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/localization/change_local_controller.dart';
import 'package:waferna/services/my_service.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../gloable_widget/text_custom.dart';

class CatagoryCardWidget extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  final List<String> images;
  const CatagoryCardWidget({
    super.key,
    required this.name,
    this.onTap,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.scaffoldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        height: heigth(6.738),
        margin: EdgeInsets.symmetric(
          vertical: heigth(160),
        ),
        decoration: BoxDecoration(
          color: AppColor.fillColor1,
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              SizedBox(
                height: heigth(6.738),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...List.generate(
                      images.isEmpty ? 3 : images.length,
                      (index) {
                        return Expanded(
                          child: images.isEmpty
                              ? Image.asset(
                                  AppImages.logoImage,
                                )
                              : CachedNetworkImage(
                                  imageUrl: images[index],
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width(4.17183),
                      height: 33,
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: FittedBox(
                        child: TextCustom(
                          text: name,
                          textColor: AppColor.whiteColor,
                          textSize: AppFontSize.size15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    CustomPaint(
                      painter: RedTrianglePainter(),
                      child: SizedBox(
                        width: width(26.737),
                        height: 33,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RedTrianglePainter extends CustomPainter {
  MyServices myServices = Get.find();
  ChangeLocaleController localController = Get.put(ChangeLocaleController());
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColor.primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(-size.width, 0);
    path.lineTo(
      localController.language == const Locale("ar") ? size.width : 0,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
