import 'dart:convert';
import 'consts.dart';
import '../models/category.dart';
import 'package:http/http.dart' as http;


class CategoryService{




 Future<List<Category>> getListOfCategories() async {
      String url = "$apiUrl/categoires/$shopId"; 
      final response = await http.get(url);
       List<Category> tempList = [];

      if(response.statusCode == 200){
        var responseBody = json.decode(response.body);
        for(int i = 0; i < responseBody.length; i++){
          tempList.add(Category.fromJson(responseBody[i]));
        }
      }
     return tempList;
  }
  



}