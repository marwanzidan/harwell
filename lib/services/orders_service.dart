import 'dart:convert';

import 'package:harwel1/models/paydetail.dart';
import 'package:harwel1/paybill.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'consts.dart' as globals;

class OrderServices {
  createOrder({String items, String region_id, String address_id}) async {
    String url = '${globals.apiUrl}/createorder';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    var response = http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'items': items,
        'region_id': region_id,
        'address_id': address_id,
      },
    ).then((value) {
      if (value.statusCode == 200) {
        print(value.body);
      } else {
        print(value.body);
      }
    });
  }

  getOrderDetails({String items, String region_id}) async {
    String url = '${globals.apiUrl}/getorderdetails';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    var response = http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'items': items,
        'region_id': region_id,
      },
    ).then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        payDetail = PayDetailModel(
          services: json.decode(value.body)['services'],
          total: json.decode(value.body)['total'].toString(),
          totalAfterTaxes: json.decode(value.body)['final'].toString(),
        );
      } else {
        print(value.body);
      }
    });
  }
}
