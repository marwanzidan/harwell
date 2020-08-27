import 'package:flutter/material.dart';
import 'package:harwel1/main.dart';

import 'package:harwel1/widgets/mainpageitem.dart';


class Searchscreen extends StatefulWidget {
   final selectItemHandler;
  Searchscreen({this.selectItemHandler});
  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(


      
      
      slivers: <Widget>[
        
    SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverList(
    delegate: SliverChildListDelegate(
      [
        TextField(
          style: TextStyle(
            fontFamily: 'GESSLIGHT',
              fontSize: 10,
              color: Color(0xFFA8A8A8)
          ),
          
          
          decoration: InputDecoration(

            

            
            
            
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            
            hintText: 'اكتب الاسم الذي ترغب في البحث عنه',
            
            hintStyle: TextStyle(
              fontFamily: 'GESSLIGHT',
              fontSize: 10,
              color: Color(0xFFA8A8A8)

            ),
            enabledBorder: UnderlineInputBorder(

              borderSide: BorderSide(
                color: Color(0xFFA8A8A8)

              ),
            ),

          ),
        )
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
                 handler: widget.selectItemHandler
              ),
            )
            .toList(),
      ),
    ),
      ],
    );
  }
}