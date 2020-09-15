import 'package:flutter/material.dart';
import 'package:harwel1/address.dart';
import 'package:harwel1/deliverydetails.dart';
import 'package:harwel1/models/Address.dart';
import 'package:harwel1/services/Address_service.dart';
import 'package:harwel1/widgets/mainpageitem.dart';

import 'main.dart';
import 'main.dart';

bool appear = buttonclick();
_EndorderState endOrderState;

class Endorder extends StatefulWidget {
  @override
  _EndorderState createState() {
    endOrderState = _EndorderState();
    return endOrderState;
  }
}

class _EndorderState extends State<Endorder> {
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
    getaddress();
  }

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
            padding: EdgeInsets.all(9),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    'انهاء الطلب',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'GESSLIGHT',
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(12),
            sliver: SliverGrid.count(
              crossAxisCount: MediaQuery.of(context).size.width > 700 ? 4 : 2,
              childAspectRatio:
                  MediaQuery.of(context).size.width > 700 ? 1.5 : 1,
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
              children: cart
                  .map(
                    (e) => Visibility(
                      visible: appear,
                      child: MainPageItem(
                        main_product_id: e['main_product_id'],
                        name: e['arabic_title'],
                        image: e['imgUrl'],
                        shortDescription: e['arabic_description'],
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
          child: GestureDetector(
            onTap: () {
              for (var i = 0; i < cart.length; i++) {
                cartIds.add(cart[i]['main_product_id']);
              }
              print(cartIds);
              setState(() {
                addresslist.length == 0
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Delvdetails()),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Address1()),
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
