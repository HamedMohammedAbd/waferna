import 'package:get/get.dart';
import 'package:waferna/core/constant/app_routes.dart';
import 'package:waferna/services/my_service.dart';
import 'package:http/http.dart' as http;

void logout() async {
  MyServices myServices = Get.find();

  Get.offAllNamed(AppRoutes.chooseLoginPage);

  // عنوان API (تأكد من تغييره حسب الـ API الخاص بك)
  String apiUrl =
      "https://wafrna.com/api/v1/auth/access-tokens/${myServices.sharedPreferences.getString("token")}";
  print(myServices.sharedPreferences.getString("token"));

  try {
    // إرسال طلب الحذف
    final response = await http.delete(
      Uri.parse(apiUrl),
      headers: {
        'x-api-token': 'vHpsSUCU1Sc9Kko0e1OtP2G5SoDuPgjDHROaCTVR3Bw=',
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString("token")}', // إذا كان مطلوبًا
      },
    );
    print(response.statusCode);

    // التحقق من الاستجابة
    if (response.statusCode == 200) {
      Get.snackbar(
        "success",
        "logout success",
      );
      print("تم حذف البيانات بنجاح");
      print("deleted success: ${response.statusCode}");
      myServices.sharedPreferences.setString("token", "");
      myServices.sharedPreferences.setString("step", "1");
      myServices.sharedPreferences.setString("userData", "");
    } else {
      print("فشل الحذف: ${response.statusCode}");
      print("الرسالة: ${response.body}");
    }
  } catch (e) {
    print("حدث خطأ: $e");
  }
}
