import 'package:flutter/material.dart';
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

  final List<dynamic>  categoriesList = [
    {
      "name" : "رياضي",
      "id" : "abc123"
    },
    {
      "name" : "اطفالي",
      "id" : "abc12123"
    },
    {
      "name" : "رجالي",
      "id" : "abc12dd3"
    },
      {
      "name" : "تخفيضات",
      "id" : "abc12dc3"
    },
    
  ];

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
          child: Row(
            
            children: [
             
              ... categoriesList.map((categoryItem) => Expanded(
                              child: Categoriesbutton(
                  categoryItem["name"],
                  categoryItem["id"] == selectedCategoryId,
                  categoryItem["id"],
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