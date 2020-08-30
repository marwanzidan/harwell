class Category {

   String id;
   String arabic_title;
   String english_title;
   String arabic_description;
   String english_description;
   String img_url;

  Category(this.id,this.arabic_title,this.english_title,this.arabic_description,this.english_description,this.img_url);

  Category.fromJson(Map<String,dynamic> json){
    this.id = json["id"].toString();
    this.arabic_title = json["arabic_title"];
    this.english_title = json["english_title"];
    this.arabic_description = json["arabic_description"];
    this.english_description = json["english_description"];
    this.img_url = json["img_url"];
  }

  // Map<String,dynamic> toJson() => {
  //   "arabic_title" : this.arabic_title,
  //   "english_title" : this.english_title,
  //   "arabic_description" : this.arabic_description,
  //   "english_description" : this.english_description,
  //   "img_url" : this.img_url,
  // };

}