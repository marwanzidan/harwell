import 'package:flutter/material.dart';
import 'package:harwel1/widgets/mainpageitem.dart';

import 'main.dart';
import 'main.dart';

class Endorder extends StatefulWidget {
  @override
  _EndorderState createState() => _EndorderState();
}

class _EndorderState extends State<Endorder> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(


      child: Column(
        children: [
          
          Column(
            children : products.map((e) => 
            MainPageItem(
 name: e['name'],
                image: e['imgUrl'],
                shortDescription: e['shortDescription'],
                price: e['price'],
            ),
            ).toList()
          )
        ],


      ),
    
    );
  }
}