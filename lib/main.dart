import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waferna/core/class/curd.dart';
import 'package:waferna/route.dart';
import 'binding/my_binding.dart';
import 'core/constant/app_color.dart';
import 'localization/change_local_controller.dart';
import 'localization/translation.dart';
import 'services/my_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  Get.put(ChangeLocaleController());
  print(myServices.sharedPreferences.getString("token"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ChangeLocaleController changeLocaleController =
        Get.put(ChangeLocaleController());
    return GetMaterialApp(
      title: 'Wafarna',
      debugShowCheckedModeBanner: false,

      initialBinding: MyBinding(),
      locale: changeLocaleController.language,
      translations: MyTranslation(),
      theme: ThemeData(
        fontFamily: "Almarai",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColor,
          ),
        ),
      ),
      getPages: routes,
      // home:Test (),
    );
  }
}
