// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waferna/services/my_service.dart';

import '../function/check_internet.dart';
import 'status_request.dart';

MyServices myServices = Get.find();

class Curd {
  Future<Either<StatusRequest, dynamic>> postData({
    required String link,
    required Map data,
    bool reqType = true,
    bool? isput,
    Map<String, String>? header,
  }) async {
    print("post data==========before");
    if (await checkInternet()) {
      print("post data==========checkInternet");
      http.Response response;

      if (isput == null) {
        if (reqType == false) {
          try {
            response = await http.get(
              Uri.parse(link),
              headers: {
                "x-api-token": "vHpsSUCU1Sc9Kko0e1OtP2G5SoDuPgjDHROaCTVR3Bw=",
                'Authorization':
                    'Bearer ${myServices.sharedPreferences.getString("token")}',
              },
            );
          } catch (e) {
            return const Left(StatusRequest.offlineFailure);
          }
        } else {
          try {
            print(myServices.sharedPreferences.getString("token"));
            response = await http.post(
              Uri.parse(link),
              headers: header ??
                  {
                    "x-api-token":
                        "vHpsSUCU1Sc9Kko0e1OtP2G5SoDuPgjDHROaCTVR3Bw=",
                    'Accept': 'application/json',
                    // 'Content-Type': 'application/json',
                    'Authorization':
                        'Bearer ${myServices.sharedPreferences.getString("token")}',
                  },
              body: data,
            );
          } catch (e) {
            print(e.toString());
            return const Left(StatusRequest.offlineFailure);
          }
        }
      } else {
        try {
          response = await http.put(
            Uri.parse(link),
            headers: {
              "x-api-token": "vHpsSUCU1Sc9Kko0e1OtP2G5SoDuPgjDHROaCTVR3Bw=",
              'Authorization':
                  'Bearer ${myServices.sharedPreferences.getString("token")}',
            },
            body: data,
          );
        } catch (e) {
          return const Left(StatusRequest.offlineFailure);
        }
      }

      try {
        print("here====================");
        dynamic responseBody = await jsonDecode(response.body.toString());
        print("================ 22 ======== here is problem");
        print("post data==========response body");
        return Right({
          "code": response.statusCode,
          "data": responseBody,
        });
        // if (response.statusCode == 200 || response.statusCode == 201) {
        //   print("post data==========success");

        //   dynamic responseBody = await jsonDecode(response.body.toString());
        //   print("post data==========response body");
        //   return Right(responseBody);
        // } else {
        //   if (response.statusCode == 401) {
        //     dynamic responseBody = await jsonDecode(response.body.toString());
        //     print(responseBody);
        //     return Right({
        //       "code": response.statusCode,
        //     });
        //   }
        //   print("${response.statusCode}=====================");
        //   if (response.statusCode == 403) {
        //     dynamic responseBody = await jsonDecode(response.body.toString());
        //     print(responseBody);
        //     return Right({
        //       "code": response.statusCode,
        //     });
        //   }
        //   if (response.statusCode == 302) {
        //     return Right({
        //       "code": response.statusCode,
        //     });
        //   } else {
        //     print(response.statusCode);
        //     return const Left(StatusRequest.serverFailure);
        //   }
        // }
      } catch (e) {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }
}
