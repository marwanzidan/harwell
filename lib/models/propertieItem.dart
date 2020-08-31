class PropertieItem{

 String id;
 String arabic_title;
 String english_title;
 String product_id;
 String propertie_id;

 PropertieItem(this.id,this.arabic_title,this.english_title,this.product_id,this.propertie_id);

 PropertieItem.fromJson(Map<String,dynamic> json){
   this.id = json["id"].toString();
   this.arabic_title = json["arabic_title"];
   this.english_title = json["english_title"];
   this.product_id = json["product_id"];
   this.propertie_id = json["propertie_id"];
 }

}