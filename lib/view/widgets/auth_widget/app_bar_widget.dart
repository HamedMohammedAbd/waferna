import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';
import '../gloable_widget/back_icon_button.dart';

AppBar appBarWidget({void Function()? onTap}) {
  return AppBar(
    backgroundColor: AppColor.scaffoldColor,
    leading: BackIconButton(
      onTap: onTap,
    ),
  );
}
