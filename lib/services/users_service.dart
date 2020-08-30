import 'dart:convert';

import 'package:harwel1/models/user.dart';

import 'consts.dart';
import 'package:http/http.dart' as http;

class UserService{

  register({String name,String email, String phone, String password}) async {
    String url = "$apiUrl/register"; 

    var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    }),
  );

  var responseBody = json.decode(response.body);

  if(response.statusCode == 200){
     return User(responseBody["user"]["id"].toString(), responseBody["user"]["name"],
      responseBody["user"]["email"],responseBody["user"]["phone"], responseBody["access_token"],);
  }

  }

}