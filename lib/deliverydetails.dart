import 'package:flutter/material.dart';
import 'package:harwel1/address.dart';
import 'package:harwel1/main.dart';
import 'package:harwel1/services/Address_service.dart';
import 'package:harwel1/services/consts.dart';

class Delvdetails extends StatefulWidget {
  @override
  _DelvdetailsState createState() => _DelvdetailsState();
}

class _DelvdetailsState extends State<Delvdetails> {
  String address = '',
      street_name = '',
      building_number = '',
      apartment_number = '',
      notes = '',
      region_id = '2',
      shop_id = '11';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image(
            image: AssetImage('images/feederlogo.png'),
          ),
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(9),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'تفاصيل التوصيل',
                        style: TextStyle(
                            fontFamily: 'GESSLIGHT',
                            fontSize: 30,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 460,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  address = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'العنوان',
                                  hintStyle: TextStyle(
                                      fontFamily: 'GESSLIGHT',
                                      fontSize: 10,
                                      color: Color(0xFF9C9696)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9C9696)))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  street_name = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'اسم الشارع',
                                  hintStyle: TextStyle(
                                      fontFamily: 'GESSLIGHT',
                                      fontSize: 10,
                                      color: Color(0xFF9C9696)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9C9696)))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  building_number = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'رقم المبني',
                                  hintStyle: TextStyle(
                                      fontFamily: 'GESSLIGHT',
                                      fontSize: 10,
                                      color: Color(0xFF9C9696)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9C9696)))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  apartment_number = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'رقم الشقة',
                                  hintStyle: TextStyle(
                                      fontFamily: 'GESSLIGHT',
                                      fontSize: 10,
                                      color: Color(0xFF9C9696)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9C9696)))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  notes = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'ملاحظات علي العنوان',
                                  hintStyle: TextStyle(
                                      fontFamily: 'GESSLIGHT',
                                      fontSize: 10,
                                      color: Color(0xFF9C9696)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF9C9696)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])),
          )
        ]),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            child: GestureDetector(
              onTap: () async {
                await Addressservice().createAddress(
                  context: context,
                  address: address,
                  apartment_number: apartment_number,
                  building_number: building_number,
                  notes: notes,
                  shop_id: shop_id,
                  region_id: region_id,
                  street_name: street_name,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Address1()),
                );
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

// class Details extends StatefulWidget {
//   Details(this.txt, this.writtenText);

//   final String txt;
//   String writtenText='';

//   @override
//   _DetailsState createState() => _DetailsState();
// }

// class _DetailsState extends State<Details> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2),
//       child: TextField(
//         onChanged: (value){
//           setState(() {
//             widget.writtenText = value;
//           });
//         },
//         decoration: InputDecoration(
//             hintText: widget.txt,
//             hintStyle: TextStyle(
//                 fontFamily: 'GESSLIGHT',
//                 fontSize: 10,
//                 color: Color(0xFF9C9696)),
//             enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xFF9C9696)))),
//       ),
//     );
//   }
// }
