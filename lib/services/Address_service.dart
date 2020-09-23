import 'dart:convert';
import 'consts.dart';
import 'package:http/http.dart' as http;
import '../models/Address.dart';


class Addressservice{
  
  
  Future<List<Address>> getListOfaddress() async {
      String url = "$apiUrl/addresses/$shopId"; 
      final response = await http.get(url);
       List<Address> tempList = [];

      if(response.statusCode == 200){
        var responseBody = json.decode(response.body);
        for(int i = 0; i < responseBody.length; i++){
          tempList.add(Address.fromJson(responseBody[i]));
        }
      }
     return tempList;
  }
  

}