import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_font_size.dart';
import '../../../core/function/height.dart';
import '../../../core/function/width.dart';
import '../gloable_widget/text_custom.dart';

class NotificationWidget extends StatelessWidget {
  final String data;
  final String date;
  const NotificationWidget({
    super.key,
    required this.data,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth(11.42),
      width: width(1),
      child: ListTile(
        leading: CircleAvatar(
          radius: width(15.24),
          backgroundColor: AppColor.primaryColor,
          child: const Center(
            child: Icon(
              Icons.notifications_none,
              color: AppColor.whiteColor,
            ),
          ),
        ),
        title: FittedBox(
          child: TextCustom(
            text: data,
            textAlign: TextAlign.center,
          ),
        ),
        subtitle: TextCustom(
          text: date,
          textColor: AppColor.hintColor,
          textSize: AppFontSize.size10,
        ),
      ),
    );
  }
}
