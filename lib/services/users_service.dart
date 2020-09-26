import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harwel1/models/user.dart';
import 'package:toast/toast.dart';

import 'consts.dart';
import 'package:http/http.dart' as http;

class UserService {
  register(
      {String name,
      String email,
      String phone,
      String password,
      BuildContext context}) async {
    String url = "$apiUrl/register";

    var response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'name': name,
        'email': email.trim(),
        'password': password.trim(),
        'phone': phone.trim(),
      }),
    );

    var responseBody = json.decode(response.body);
    print(responseBody);
    if (response.statusCode == 200) {
      print(responseBody['access_token']);
      return User(
        responseBody["user"]["id"].toString(),
        responseBody["user"]["phone"],
        responseBody["user"]["name"],
        responseBody["user"]["email"],
        responseBody["access_token"],
      );
    } else {
      Toast.show("حدث خطأ اثناء التسجيل", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

  /// login function
  login({String email, String password, BuildContext context}) async {
    String url = "$apiUrl/login";

    var response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    var responseBody = json.decode(response.body);
    print(responseBody);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return User(
        responseBody["user"]["id"].toString(),
        responseBody["user"]["phone"],
        responseBody["user"]["name"],
        responseBody["user"]["email"],
        responseBody["access_token"],
      );
    } else if (response.statusCode == 422) {
      Toast.show("البريد الالكتروني خطأ", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      print(response.statusCode);
      return User(
        null,
        null,
        null,
        null,
        null,
      );
    } else if (response.statusCode == 401) {
      Toast.show("كلمة المرور او البريد الالكتروني خطأ", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return User(
        null,
        null,
        null,
        null,
        null,
      );
    }
  }
}
