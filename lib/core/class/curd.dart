// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'status_request.dart';

class Curd {
  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    print("post data==========before");
    // if (await checkInternet()) {
    print("post data==========checkInternet");
    var response = await http.post(Uri.parse(link), body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("post data==========success");

      dynamic responseBody = await jsonDecode(response.body.toString());
      print("post data==========response body");
      return Right(responseBody);
    } else {
      return const Left(StatusRequest.serverFailure);
    }
    // } else {
    //   return const Left(StatusRequest.offlineFailure);
    // }
  }
}
