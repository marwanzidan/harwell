import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harwel1/paybill.dart';
import 'package:harwel1/services/Address_service.dart';

import './models/Address.dart';

class Address1 extends StatefulWidget {
  @override
  _Address1State createState() => _Address1State();
}

class _Address1State extends State<Address1> {
  int index = 0;
  List<Address> addresslist;
  getaddress() async {
    var address = await Addressservice().getListOfaddress();
    setState(() {
      addresslist = address;
      print(addresslist);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getaddress();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                Column(
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
                                txt: 'اختر عنوان التوصيل',
                                type: '',
                              ),
                            ),
                          ),
                          Column(
                              children: addresslist == null
                                  ? [Text("جاري التحميل")]
                                  : addresslist
                                      .map(
                                        (x) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              index = addresslist.indexOf(x);
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Color(0XFFEFD7D7))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              17.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Addresstxt(
                                                            txt: x.address,
                                                            type: 'العنوان : ',
                                                          ),
                                                          Addresstxt(
                                                            txt: x.street_name,
                                                            type:
                                                                'اسم الشارع : ',
                                                          ),
                                                          Addresstxt(
                                                            txt: x
                                                                .building_number,
                                                            type:
                                                                'رقم المبنى : ',
                                                          ),
                                                          Addresstxt(
                                                            txt: x
                                                                .apartment_number,
                                                            type:
                                                                'رقم الشقة : ',
                                                          ),
                                                          x.notes == null
                                                              ? Container()
                                                              : Addresstxt(
                                                                  txt: x.notes,
                                                                  type:
                                                                      'الملاحظات علي العنوان : ',
                                                                ),
                                                          // Addresstxt(
                                                          //   txt: x.region_id,
                                                          //   type: 'المنطقة : ',
                                                          // )
                                                        ],
                                                      ),
                                                    ),
                                                    index ==
                                                            addresslist
                                                                .indexOf(x)
                                                        ? Icon(
                                                            FontAwesomeIcons
                                                                .solidCheckCircle,
                                                            color: Color(
                                                                0xFFF6BF0B),
                                                          )
                                                        : Icon(
                                                            FontAwesomeIcons
                                                                .checkCircle,
                                                            color: Colors.black,
                                                          ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()),
                        ],
                      ),
                    ),
                  ],
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
                        builder: (BuildContext context) => Billdetails()),
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
      ),
    );
  }
}

class Addresstxt extends StatelessWidget {
  final String txt, type;
  Addresstxt({this.txt, this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          type,
          style: TextStyle(
              color: Colors.black, fontFamily: 'GESSBOLD', fontSize: 10),
        ),
        Text(
          txt,
          style: TextStyle(
              color: Colors.black, fontFamily: 'GESSBOLD', fontSize: 10),
        ),
      ],
    );
  }
}
