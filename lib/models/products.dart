import 'propertie.dart';
import 'propertieItem.dart';

class Product {
   String id;
   String arabic_title;
   String english_title;
   String arabic_description;
   String english_description;
   String img_url;
   String category_id;
   String main_product_id;
   double price;

   // when get product Detials
   List<String> images;
   List<Propertie> properties;
   List<PropertieItem> propertiesItems;
   


   Product(this.id,this.arabic_title,this.english_title,this.arabic_description,
   this.english_description,this.img_url,this.category_id,this.main_product_id,this.price,this.images,this.properties,this.propertiesItems);

   Product.fromJson(Map<String,dynamic>json)
   {
    this.id = json["id"].toString();
    this.arabic_title = json["arabic_title"];
    this.english_title = json["english_title"];
    this.arabic_description = json["arabic_description"];
    this.english_description = json["english_description"];
    // this.img_url = json["img_url"];
    this.category_id =json["category_id"].toString();
    this.main_product_id = json["main_product_id"].toString();
    this.price =json["price"];
   }


}