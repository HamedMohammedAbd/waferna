import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/logout.dart';
import 'package:waferna/core/function/storage_user_data.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/button_custom.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../../controller/home_controller/my_profile_controller.dart';
import '../../widgets/home_widget/stack_image.dart';

class MyProfilePage extends GetView<MyProfileControllerImp> {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyProfileControllerImp());
    return controller.userType == "2"
        ? Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(width(20.8857)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.network(
                    dataStorage().imageUrl!,
                  ),
                  SizedBox(
                    height: heigth(50),
                  ),
                  TextCustom(
                    text: "asVestor".tr,
                    fontWeight: FontWeight.bold,
                    textSize: AppFontSize.size18,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: heigth(10),
                  ),
                  ButtonCustom(
                    text: "createAccount".tr,
                    onTap: () => controller.asVestor(),
                  ),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            padding: EdgeInsets.all(width(20.8857)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                StackImage(
                  isChangeImage: false,
                  image: dataStorage().imageUrl,
                ),
                ...List.generate(
                  controller.pageData.length,
                  (index) {
                    String name = controller.pageData[index]["name"];
                    IconData icon = controller.pageData[index]["icon"];
                    void Function()? onTap =
                        controller.pageData[index]["onTap"];
                    return ListTile(
                      onTap: onTap,
                      title: TextCustom(text: name.tr),
                      leading: CircleAvatar(
                        radius: width(27.1243),
                        backgroundColor: AppColor.primaryColor,
                        child: Center(
                          child: Icon(
                            icon,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
                SizedBox(
                  height: heigth(5),
                ),
                ButtonCustom(
                  text: "logout".tr,
                  onTap: () {
                    logout();
                  },
                ),
              ],
            ),
          );
  }
}
