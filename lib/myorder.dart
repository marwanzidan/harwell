import 'package:flutter/material.dart';
import 'package:harwel1/main.dart';
import 'package:easy_localization/easy_localization.dart';

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
          title: Container(
            height: 50,
            width: 50,
            child: Image(
              image: AssetImage('images/logo.jpg'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'myOrders'.tr().toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'GESSLIGHT'),
                ),
              ),
              Column(
                  children: orders
                      .map((order) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xFF707070))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          order['order no'],
                                          style: TextStyle(
                                              fontFamily: 'GESSBOLD',
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              order['time'],
                                              style: TextStyle(
                                                  fontFamily: 'LATOLIGHT',
                                                  fontSize: 10,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              order['date'],
                                              style: TextStyle(
                                                  fontFamily: 'LATOLIGHT',
                                                  fontSize: 10,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Divider(
                                        thickness: 1,
                                        color: Color(0xFFEBEBEB),
                                      ),
                                    ),
                                    Text(
                                      'order'.tr().toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'GESSLIGHT',
                                          color: Colors.black),
                                    ),
                                    Text(
                                      order['the order'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'GESSLIGHT',
                                        color: Color(0xFFBCB3B3),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Divider(
                                        thickness: 1,
                                        color: Color(0xFFEBEBEB),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'delivery'.tr().toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'GESSLIGHT',
                                              fontSize: 10),
                                        ),
                                        Text(
                                          order['delivery fees'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'GESSLIGHT',
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'finalTotal'.tr().toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'GESSLIGHT',
                                              fontSize: 10),
                                        ),
                                        Text(
                                          order['total'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'GESSLIGHT',
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Divider(
                                        thickness: 1,
                                        color: Color(0xFFEBEBEB),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'address'.tr().toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'GESSLIGHT',
                                              fontSize: 10),
                                        ),
                                        Text(
                                          order['address'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'GESSLIGHT',
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList())
            ],
          ),
        ),
      ),
    );
  }
}
