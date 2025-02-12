import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/constant/app_color.dart';
import 'package:waferna/core/constant/app_font_size.dart';
import 'package:waferna/core/constant/app_routes.dart';
import 'package:waferna/core/function/height.dart';
import 'package:waferna/core/function/width.dart';
import 'package:waferna/view/widgets/gloable_widget/text_custom.dart';

import '../../../controller/home_controller/nav_home_controller.dart';
import '../../../core/function/show_setting_dialog.dart';
import '../../../core/function/storage_user_data.dart';
import '../../widgets/home_widget/home_app_bar.dart';
import 'main_home_page.dart';
import 'my_profile_page.dart';

class NavHomePage extends StatelessWidget {
  const NavHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavHomeControllerImp());
    return GetBuilder<NavHomeControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: homeAppBar(
            title: controller.currentIndex == 0 ? "home".tr : "profile".tr,
            onTap: () {
              showSettingDialog(
                title: "Settings",
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: InkWell(
            onTap: myServices.sharedPreferences.getString("userType") == "2"
                ? () {
                    Get.snackbar(
                      "warning".tr,
                      "MessageWarning".tr,
                    );
                  }
                : () {
                    Get.bottomSheet(
                      BottomSheet(
                        onClosing: () {},
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.all(width(40)),
                            height: dataStorage().userType == "customer"
                                ? heigth(6.5)
                                : heigth(4.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                dataStorage().userType != "customer"
                                    ? ListTile(
                                        onTap: () => Get.toNamed(
                                          AppRoutes.addOfferPage,
                                        ),
                                        leading: Icon(
                                          Icons.add,
                                          color: AppColor.hintColor,
                                          size: AppFontSize.size25 + 10,
                                        ),
                                        title: Container(
                                          padding: EdgeInsets.only(
                                            bottom: heigth(58.7143),
                                          ),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(),
                                            ),
                                          ),
                                          child: TextCustom(
                                            text: "addNewOffers".tr,
                                            textSize: AppFontSize.size20,
                                          ),
                                        ),
                                      )
                                    : Container(),
                                ListTile(
                                  onTap: () => Get.toNamed(
                                    AppRoutes.waitingOrderPage,
                                  ),
                                  leading: Icon(
                                    Icons.add,
                                    color: AppColor.hintColor,
                                    size: AppFontSize.size25 + 10,
                                  ),
                                  title: Container(
                                    padding: EdgeInsets.only(
                                        bottom: heigth(58.7143)),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(),
                                      ),
                                    ),
                                    child: TextCustom(
                                      text: "ProductWaitingRequest".tr,
                                      textSize: AppFontSize.size20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
            child: Container(
              width: width(7.9375),
              height: width(7.9375),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor,
                border: Border.all(
                  width: 2,
                  color: AppColor.scaffoldColor,
                ),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    color: AppColor.hintColor,
                    offset: Offset(-0.5, 0),
                  ),
                ],
              ),
              child: const FittedBox(
                child: Icon(
                  Icons.add,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColor.scaffoldColor,
            elevation: 0,
            onTap: (index) => controller.changeCurrentIndex(index),
            currentIndex: controller.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: "home".tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.perm_identity_rounded),
                label: "profile".tr,
              ),
            ],
          ),
          body: controller.currentIndex == 0
              ? const MainHomePage()
              : const MyProfilePage(),
        );
      },
    );
  }
}
