import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../gloable_widget/button_custom.dart';
import '../gloable_widget/text_custom.dart';

class ProductsCardDetails extends StatelessWidget {
  final String title, description, location, price;
  const ProductsCardDetails({
    super.key,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth(4.618),
      width: width(1),
      decoration: const BoxDecoration(
        color: AppColor.fillColor1,
      ),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(
            width(31.75),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      text: title,
                      textSize: AppFontSize.size18,
                      textColor: AppColor.primaryColor,
                    ),
                    TextCustom(
                      text: description,
                      textSize: AppFontSize.size13,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColor.primaryColor,
                        ),
                        TextCustom(
                          text: location,
                          textSize: AppFontSize.size15,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.tImage,
                    ),
                    FittedBox(
                      child: TextCustom(
                        text: "السعر : $price ريال ",
                        textSize: AppFontSize.size18,
                        textColor: AppColor.primaryColor,
                      ),
                    ),
                    const Spacer(),
                    ButtonCustom(
                      height: heigth(26.52),
                      borderRadius: 20,
                      text: "details".tr,
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
