import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/app_color.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final void Function()? noInternet;

  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
    this.noInternet,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: InkWell(
                  onTap: noInternet,
                  child: TextCustom(
                    text: "NoInternet".tr,
                    fontWeight: FontWeight.bold,
                    textColor: AppColor.primaryColor,
                    textSize: AppFontSize.size20,
                  ),
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: TextCustom(
                      text: "ServerError".tr,
                      fontWeight: FontWeight.bold,
                      textColor: AppColor.primaryColor,
                      textSize: AppFontSize.size20,
                    ),
                  )
                : widget;
  }
}
