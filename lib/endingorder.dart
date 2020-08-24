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
    return Scaffold(

       appBar: AppBar(
        title: Image(
          image: AssetImage('images/logo.png'),
        ),
       ),
          body: CustomScrollView(


        
        
        slivers: <Widget>[
          
      SliverPadding(
        padding: EdgeInsets.all(0),
        sliver: SliverList(
      delegate: SliverChildListDelegate(
        [
          Text('انهاء الطلب',style: 
          TextStyle(
            fontSize: 30,
            fontFamily: 'GESSLIGHT',
            color: Colors.white
          ),)
        ],
      ),
),
        
      ),
      SliverPadding(
        padding: EdgeInsets.all(12),
        sliver: SliverGrid.count(
          crossAxisCount: 1,
          childAspectRatio: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 9,
          children: products
              .map(
                (e) => MainPageItem(
                  name: e['name'],
                  image: e['imgUrl'],
                  shortDescription: e['shortDescription'],
                  price: e['price'],
                  cancButton: true,
                   
                ),
              )
              .toList(),
        ),
      ),
      SliverPadding(padding: EdgeInsets.all(0),
      sliver: SliverList(delegate: SliverChildListDelegate(
        [
           Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
               decoration: BoxDecoration(
              color: Color(0xFFF6BF0B),
              borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('تأكيد ',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'GESSBOLD',
                color : Colors.black
              ),),
            ),
        ),

            ),
          ),
        ]
      )),
      )
        ],
      ),
    );
  }
}