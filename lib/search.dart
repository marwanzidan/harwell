import 'package:flutter/material.dart';
import 'package:harwel1/main.dart';

import 'package:harwel1/widgets/mainpageitem.dart';
import 'package:easy_localization/easy_localization.dart';
import 'models/products.dart';
import 'services/product_service.dart';

class Searchscreen extends StatefulWidget {
  final selectItemHandler;
  Searchscreen({this.selectItemHandler});
  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController textController = TextEditingController();
  List<Product> prodcustList;
  getProducts() async {
    var products = await Productservice().getListOfproducts();
    setState(() {
      prodcustList = products;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  TextField(
                    controller: textController,
                    style: TextStyle(
                        fontFamily: 'GESSLIGHT',
                        fontSize: 10,
                        color: Color(0xFFA8A8A8)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: 'searchHint'.tr().toString(),
                      hintStyle: TextStyle(
                          fontFamily: 'GESSLIGHT',
                          fontSize: 10,
                          color: Color(0xFFA8A8A8)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA8A8A8)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(12),
            sliver: SliverGrid.count(
              crossAxisCount: prodcustList == null ? 1 : 2,
              childAspectRatio: (3 / 4),
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
              children: prodcustList == null
                  ? [
                      Scaffold(
                        body: Center(
                            child: Container(
                                child: Text('loading'.tr().toString()))),
                      ),
                    ]
                  : prodcustList
                      .map(
                        (e) => MainPageItem(
                          name: e.english_title,
                          price: e.price.toString(),
                          shortDescription: e.arabic_description,
                          image:
                              "https://hips.hearstapps.com/delish/assets/17/36/1504715566-delish-fettuccine-alfredo.jpg",
                        ),
                      )
                      .toList()
                      .where((element) =>
                          element.name.contains(textController.text))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
