// ignore_for_file: avoid_print

import '../../../core/class/curd.dart';

class GetData {
  Curd curd;

  GetData(this.curd);

  getData({
    required Map<String, dynamic> map,
    required String api,
    bool reqType = true,
    bool? isput,
    Map<String, String>? header,
  }) async {
    print("========before===");
    var response = await curd.postData(
      data: map,
      link: api,
      reqType: reqType,
      isput: isput,
      header: header,
    );
    print(response.toString());
    print("=======after====");
    return response.fold((l) => l, (r) => r);
  }
}
