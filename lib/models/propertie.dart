class Propertie{

 String id;
 String arabic_title;
 String english_title;
 String main_product_id;

 Propertie(this.id,this.arabic_title,this.english_title,this.main_product_id);

 Propertie.fromJson(Map<String,dynamic> json){
   this.id = json["id"].toString();
   this.arabic_title = json["arabic_title"];
   this.english_title = json["english_title"];
   this.main_product_id = json["main_product_id"];
 }

}