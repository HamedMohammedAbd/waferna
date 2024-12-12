import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';
import 'package:waferna/view/screen/auth/login_page.dart';
import 'package:waferna/view/screen/choose_login_page.dart';
import 'package:waferna/view/screen/home/nav_home_page.dart';
import 'package:waferna/view/screen/on_boarding.dart';

import 'core/middelware/my_middelware.dart';
import 'view/screen/auth/sign_up_page.dart';
import 'view/screen/home/add_offer_page.dart';
import 'view/screen/home/catagory_details_page.dart';
import 'view/screen/home/notification_page.dart';
import 'view/screen/home/waiting_list_page.dart';
import 'view/screen/home/waiting_order_page.dart';

List<GetPage<dynamic>>? routes = <GetPage<dynamic>>[
  GetPage<dynamic>(
    name: "/",
    page: () => const OnBoarding(),
    middlewares: [
      MyMiddleware(),
    ],
  ),
  GetPage<dynamic>(
    name: AppRoutes.chooseLoginPage,
    page: () => const ChooseLoginPage(),
  ),
  //auth
  GetPage<dynamic>(
    name: AppRoutes.loginPage,
    page: () => const LoginPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.signUpPage,
    page: () => const SignUpPage(),
  ),
  //home
  GetPage<dynamic>(
    name: AppRoutes.navHomePgae,
    page: () => const NavHomePage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.catagoryDetailsPage,
    page: () => const CatagoryDetailsPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.waitingListPage,
    page: () => const WaitingListPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.notificationPage,
    page: () => const NotificationPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.addOfferPage,
    page: () => const AddOfferPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.waitingOrderPage,
    page: () => const WaitingOrderPage(),
  ),
];
