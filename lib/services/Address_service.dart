import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harwel1/address.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'consts.dart';
import 'package:http/http.dart' as http;
import '../models/Address.dart';

class Addressservice {
  Future<bool> createAddress({
    BuildContext context,
    String address,
    String street_name,
    String apartment_number,
    String building_number,
    String notes,
    String region_id,
    String shop_id,
  }) async {
    String url = "$apiUrl/addresses";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    final response = await http.post(url, headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': ' $token'
    }, body: {
      'address': address,
      'street_name': street_name,
      'apartment_number': apartment_number,
      'building_number': building_number,
      'notes': notes,
      'region_id': region_id,
      'shop_id': shop_id,
    });
    print(response.body);

    if (response.statusCode == 201) {
      print('address created');
      return true;
    } else {
      return false;
    }
  }

  Future<List<Address>> getListOfaddress() async {
    String url = "$apiUrl/addresses/$shopId";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token');
    print(token);
    final response = await http.get(url, headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    List<Address> tempList = [];

    if (response.statusCode == 200) {
      print(response.body);
      var responseBody = json.decode(response.body);
      for (int i = 0; i < responseBody.length; i++) {
        // tempList.add(Address.fromJson(responseBody[i]));
        tempList.add(
          Address(
            address: responseBody[i]['address'],
            apartment_number: responseBody[i]['apartment_number'],
            building_number: responseBody[i]['building_number'],
            notes: responseBody[i]['notes'],
            region_id: responseBody[i]['region_id'],
            street_name: responseBody[i]['street_name'],
          ),
        );
      }
    } else {
      print(tempList);
    }
    return tempList;
  }
}
