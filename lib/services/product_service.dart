import 'dart:convert';
import 'consts.dart';
import 'package:http/http.dart' as http;
import '../models/products.dart';

class Productservice{

   Future<List<Product>> getListOfproducts() async {
      String url = "$apiUrl/products/$shopId"; 
      final response = await http.get(url);
       List<Product> tempList = [];

      if(response.statusCode == 200){
        var responseBody = json.decode(response.body);
        for(int i = 0; i < responseBody.length; i++){
          tempList.add(Product.fromJson(responseBody[i]));
        }
      }
     return tempList;
   }


}
