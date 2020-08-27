import 'package:flutter/material.dart';
import 'package:harwel1/main.dart';
class Myorders extends StatefulWidget {
  @override
  _MyordersState createState() => _MyordersState();
}

class _MyordersState extends State<Myorders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
             appBar: AppBar(
        title: Image(
          image: AssetImage('images/feederlogo.png'),
        ),
       ),

        body: SingleChildScrollView(

          child : Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('طلبتاي',
                style: TextStyle(
                  color : Colors.black,
                  fontSize: 30,
                  fontFamily: 'GESSLIGHT'
                ),),
                              ),
              ),

              Column(
                children  :  orders.map((order) => 
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0xFF707070)
                      )
                    ),

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(order['order no'],
                            style: TextStyle(
                              fontFamily: 'GESSBOLD',
                              fontSize: 15,
                              color: Colors.black
                            ),
                            ),
                            Row(
                              children: [
                               
                            
                            Text(order['time'],
                            style: TextStyle(
                              fontFamily: 'LATOLIGHT',
                              fontSize: 10,
                              color: Colors.black
                            ),
                            ),
                            Text(order['date'],
                            style: TextStyle(
                              fontFamily: 'LATOLIGHT',
                              fontSize: 10,
                              color: Colors.black
                            ),
                            ),

                              ],
                            ),

                        ],),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Divider(
                            thickness: 1,
                            color: Color(0xFFEBEBEB),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                                              child: Text('الطلب',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'GESSLIGHT',
                            color:Colors.black
                          ),),
                        ),
                         Align(
                           alignment: Alignment.centerRight,
                                                child: Text(order['the order'] ,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'GESSLIGHT',
                            color:Color(0xFFBCB3B3),

                        ),),
                         ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Divider(
                            thickness: 1,
                            color: Color(0xFFEBEBEB),
                          ),
                        ),
                        Row(
                          children: [
                            Text('التوصيل :',
                            style: TextStyle(
                              color : Colors.black,
                              fontFamily: 'GESSLIGHT',
                              fontSize: 10
                            ),),
                             Text(order['delivery fees'],
                            style: TextStyle(
                              color : Colors.black,
                              fontFamily: 'GESSLIGHT',
                              fontSize: 10
                            ),)
                          ],
                        ),
                         Row(
                          children: [
                            Text('الاجمالي :',
                            style: TextStyle(
                              color : Colors.black,
                              fontFamily: 'GESSLIGHT',
                              fontSize: 10
                            ),),
                             Text(order['total'],
                            style: TextStyle(
                              color : Colors.black,
                              fontFamily: 'GESSLIGHT',
                              fontSize: 10
                            ),)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Divider(
                            thickness: 1,
                            color: Color(0xFFEBEBEB),
                          ),
                        ),
                         Row(
                            children: [
                              Text('عنوان التوصيل :',
                              style: TextStyle(
                                color : Colors.black,
                                fontFamily: 'GESSLIGHT',
                                fontSize: 10
                              ),),
                               Text(order['address'],
                              style: TextStyle(
                                color : Colors.black,
                                fontFamily: 'GESSLIGHT',
                                fontSize: 10
                              ),)
                            ],
                          ),
                        
                      ],
                    ),
                  ),
                  ),
                )
                
                ).toList()
              )
            ],


          ),
        ),
        
      ),
    );
  }
}