import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harwel1/address.dart';
import 'package:harwel1/main.dart';
import 'package:harwel1/models/paydetail.dart';
import 'package:harwel1/orderdone.dart';
import 'package:harwel1/services/orders_service.dart';

TextStyle st =
    TextStyle(color: Colors.black, fontFamily: 'GESSLIGHT', fontSize: 10);

class Billdetails extends StatefulWidget {
  @override
  _BilldetailsState createState() => _BilldetailsState();
}

PayDetailModel payDetail;

class _BilldetailsState extends State<Billdetails> {
  String tempList = '';
  getItemsId() async {
    for (var i = 0; i < cart.length; i++) {
      if (i == cart.length - 1) {
        tempList += (cart[i]['id'].toString());
        print('items: ' + tempList);
      } else {
        tempList += (cart[i]['id'].toString()) + ',';
      }
    }
  }

  @override
  void initState() {
    getItemsId();

    OrderServices().getOrderDetails(items: tempList, region_id: '2');
    print(json.encode(payDetail));

    // OrderServices()
    //     .createOrder(items: tempList, address_id: '1', region_id: '2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage('images/feederlogo.png'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'تفاصيل التوصيل',
                          style: TextStyle(
                              fontFamily: 'GESSLIGHT',
                              fontSize: 30,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 460,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Addresstxt(
                                txt: 'الفاتورة',
                                type: '',
                              ),
                            ),
                          ),
                          Column(
                              children: billdetails
                                  .map(
                                    (x) => Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0XFFEFD7D7))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(children: [
                                                  Text(
                                                    'المجموع  :  ',
                                                    style: st,
                                                  ),
                                                  Text(
                                                    x['total before'],
                                                    style: st,
                                                  )
                                                ]),
                                                Row(children: [
                                                  Text(
                                                    'خصم  :  ',
                                                    style: st,
                                                  ),
                                                  Text(
                                                    x['discount'],
                                                    style: st,
                                                  )
                                                ]),
                                                Row(children: [
                                                  Text(
                                                    'الشحن  :  ',
                                                    style: st,
                                                  ),
                                                  Text(
                                                    x['delivery'],
                                                    style: st,
                                                  )
                                                ]),
                                                Row(children: [
                                                  Text(
                                                    'الضريبة  :  ',
                                                    style: st,
                                                  ),
                                                  Text(
                                                    x['Tax'],
                                                    style: st,
                                                  )
                                                ]),
                                                Row(children: [
                                                  Text(
                                                    'الاجمالي  :  ',
                                                    style: st,
                                                  ),
                                                  Text(
                                                    x['total after'],
                                                    style: st,
                                                  )
                                                ]),
                                              ],
                                            ),
                                          ),
                                          Icon(Icons.check_box,
                                              color: Color(0xFFFDBA52))
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'الكود التجريبي',
                                  hintStyle: TextStyle(
                                      fontFamily: 'GESSLIGHT',
                                      fontSize: 10,
                                      color: Color(0xFF9C9696)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9C9696)))),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFFDBA52),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'تطبيق',
                                    style: TextStyle(
                                        fontFamily: 'GESSBOLD',
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Orderdone()),
                );
              });
            },
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  color: Color(0xFFF6BF0B),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'تأكيد ',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'GESSBOLD',
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
