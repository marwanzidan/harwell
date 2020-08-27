import 'package:flutter/material.dart';
import 'package:harwel1/deliverydetails.dart';
import 'package:harwel1/widgets/mainpageitem.dart';

import 'main.dart';


bool appear= buttonclick();

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
          image: AssetImage('images/feederlogo.png'),
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
            color: Colors.black
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
                (e) => Visibility(
                  visible: appear,
                                  child: MainPageItem(
                    name: e['name'],
                    image: e['imgUrl'],
                    shortDescription: e['shortDescription'],
                    price: e['price'],
                    cancButton: true,
                     
                  ),
                ),
              )
              .toList(),
        ),
      ),
      
        ],
      ),

     
     bottomNavigationBar: BottomAppBar(
       
       child:  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 13),
         child: GestureDetector(
            onTap: (){
         setState(() {
           
           Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Delvdetails()
               ),
               );
         });

            },
                   child: Container(
         width: double.infinity,
         height: 70,
          decoration: BoxDecoration(
         color: Color(0xFFF6BF0B),
         borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
         child: Padding(
           padding: const EdgeInsets.all(20),
           child: Text('تأكيد ',
           style: TextStyle(
          fontSize: 25,
          fontFamily: 'GESSBOLD',
          color : Colors.black
           ),),
         ),
            ),

           ),
         ),
       ),
     ),
    );
  }
}