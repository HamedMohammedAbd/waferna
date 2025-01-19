import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/function/height.dart';
import '../gloable_widget/text_custom.dart';

class WaitingListCardWidget extends StatelessWidget {
  final String name, description, dayCount;
  const WaitingListCardWidget({
    super.key,
    required this.name,
    required this.description,
    required this.dayCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth(11.58),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColor.waitingListCardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustom(
                    text: name,
                    textColor: AppColor.primaryColor,
                    textSize: AppFontSize.size20,
                  ),
                  TextCustom(
                    text: "($dayCount)",
                    textColor: AppColor.primaryColor,
                    textSize: AppFontSize.size20,
                  ),
                ],
              ),
              FittedBox(
                child: TextCustom(
                  text: description,
                  textSize: AppFontSize.size10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
