import 'dart:convert';
import 'consts.dart';
import 'package:http/http.dart' as http;
import '../models/products.dart';
import '../models/propertie.dart';
import '../models/propertieItem.dart';

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



   Future<Product> getProductDetails(String productId) async {
      String url = "$apiUrl/products/$shopId/$productId/"; 
      final response = await http.get(url);
      // Product test = null;

      if(response.statusCode == 200){
        var responseBody = json.decode(response.body);

        List<String> images= [];
        List<Propertie> properties = [];
        List<PropertieItem> propertiesItems = [];

      if(responseBody["images"] != null){
        for(int i = 0; i < responseBody["images"].length; i++){
          images.add(responseBody["images"][i]["img_url"]);
        }
      }

      if(responseBody["propertie"] != null){
        for(int i = 0; i < responseBody["propertie"].length; i++){
          properties.add(Propertie.fromJson(responseBody["propertie"][i]));
        }
      }

      // print(responseBody["properties_items"]);

      if(responseBody["properties_items"] != null){
        for(int i = 0; i < responseBody["properties_items"].length; i++){
          propertiesItems.add(PropertieItem.fromJson(responseBody["properties_items"][i]));
        }
      }

      return Product(
        responseBody["product"]["id"].toString(),
        responseBody["product"]["arabic_title"],
        responseBody["product"]["english_title"],
        responseBody["product"]["arabic_description"],
        responseBody["product"]["english_description"],
        responseBody["product"]["img_url"],
        responseBody["product"]["category_id"].toString(),
        responseBody["product"]["main_product_id"].toString(),
        responseBody["product"]["price"].toDouble(),
        images,
        properties,
        propertiesItems,
      );

      }
    //  return tempList;
   }





}
