import 'package:get/get.dart';

import '../core/class/curd.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd());
  }
}
