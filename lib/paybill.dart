import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harwel1/address.dart';
import 'package:harwel1/main.dart';
import 'package:harwel1/models/paydetail.dart';
import 'package:harwel1/orderdone.dart';
import 'package:harwel1/orderwithoutLogin.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'deliveryDetails'.tr().toString(),
                        style: TextStyle(
                            fontFamily: 'GESSLIGHT',
                            fontSize: 30,
                            color: Colors.black),
                      ),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Addresstxt(
                              txt: 'bill'.tr().toString(),
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
                                                  'total'.tr().toString() +
                                                      'currency'
                                                          .tr()
                                                          .toString(),
                                                  style: st,
                                                ),
                                                Text(
                                                  x['total before'],
                                                  style: st,
                                                )
                                              ]),
                                              Row(children: [
                                                Text(
                                                  'discount'.tr().toString() +
                                                      'currency'
                                                          .tr()
                                                          .toString(),
                                                  style: st,
                                                ),
                                                Text(
                                                  x['discount'],
                                                  style: st,
                                                )
                                              ]),
                                              Row(children: [
                                                Text(
                                                  'shipment'.tr().toString() +
                                                      'currency'
                                                          .tr()
                                                          .toString(),
                                                  style: st,
                                                ),
                                                Text(
                                                  x['delivery'],
                                                  style: st,
                                                )
                                              ]),
                                              Row(children: [
                                                Text(
                                                  'tax'.tr().toString() +
                                                      'currency'
                                                          .tr()
                                                          .toString(),
                                                  style: st,
                                                ),
                                                Text(
                                                  x['Tax'],
                                                  style: st,
                                                )
                                              ]),
                                              Row(children: [
                                                Text(
                                                  'finalTotal'
                                                          .tr()
                                                          .toString() +
                                                      'currency'
                                                          .tr()
                                                          .toString(),
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
                                hintText: 'promoCode'.tr().toString(),
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
                                  'apply'.tr().toString(),
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
                      builder: (BuildContext context) => OrderWithoutLogin()),
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
                    'confirm'.tr().toString(),
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
