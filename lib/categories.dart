import 'package:flutter/material.dart';
import 'package:harwel1/models/category.dart';
import 'package:harwel1/services/category_service.dart';
import 'package:harwel1/widgets/mainpageitem.dart';



import 'main.dart';


class Categories extends StatefulWidget {
  
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  String selectedCategoryId = null;

  selectCategoryHandler(String id){
    setState(() {
      selectedCategoryId = id;
    });
  }

  getCategories() async {
    var categories = await CategoryService().getListOfCategories();
    setState(() {
      categoriesList = categories;
    });
  }

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  List<Category> categoriesList;


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(


      
      
      slivers: <Widget>[
        
    SliverPadding(
      padding: EdgeInsets.all(0),
      sliver: SliverList(
    delegate: SliverChildListDelegate(
      [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:  categoriesList == null ? Text("جاري التحميل") : Row(
            children: [
              ...categoriesList.map((categoryItem) => Expanded(
                              child: Categoriesbutton(
                  categoryItem.arabic_title,
                  categoryItem.id == selectedCategoryId,
                  categoryItem.id,
                  selectCategoryHandler
                  ),
              ) ).toList(),
              
         
            ],
          ),
        ),
        
      ],
    ),
),
      
    ),
    SliverPadding(
      padding: EdgeInsets.all(12),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        childAspectRatio: (3 / 4),
        crossAxisSpacing: 9,
        mainAxisSpacing: 9,
        children: products
            .map(
              (e) => MainPageItem(
                name: e['name'],
                image: e['imgUrl'],
                shortDescription: e['shortDescription'],
                price: e['price'],
              ),
            )
            .toList(),
      ),
    ),
      ],
    );
  }
}

class Categoriesbutton extends StatelessWidget {
  
  Categoriesbutton(this.txt,this.isSelected,this.id,this.selectorHandler);

  final String txt;
  final bool isSelected;
  var selectorHandler;
  final String id;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectorHandler(id),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              
          decoration: BoxDecoration(
                           boxShadow: [
      BoxShadow(
        color: Color(0xFF979595).withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 6,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
            
            borderRadius: BorderRadius.circular(5),
            color: isSelected ? Colors.orange : Colors.white
          ),
          
          child:Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
              child: Text(txt,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'GESSBOLD',
                fontSize: 15

              ),),
            ),
          ) ,
        ),
          ),
    );
  }
}