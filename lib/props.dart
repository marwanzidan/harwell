import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harwel1/itemprop.dart';
import 'package:harwel1/main.dart';
import 'package:harwel1/models/products.dart';

import './services/product_service.dart';


class Props extends StatefulWidget {
  String id;
  Props(this.id);

  @override
  _PropsState createState() => _PropsState();
}

class _PropsState extends State<Props> {
  int _current = 0;
  Product product;

  getProductDetails() async {
    var tempProduct = await Productservice().getProductDetails(widget.id);
    setState(() {
      product = tempProduct;
    });
    print(product);
  }

  @override
  void initState() {
    super.initState();
    getProductDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: product == null ? SpinKitWanderingCubes(
                      color: Colors.orange,
                      size: 50.0,
                  ) : CustomScrollView(
            slivers:<Widget> [
              SliverPadding(padding: EdgeInsets.all(0),
              sliver: SliverList(delegate: SliverChildListDelegate(
                [ product.images.length == 0 ? SizedBox() :  
                Container(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                                    child: Align(alignment: Alignment.centerLeft,
                      child: Icon(Icons.cancel,color: Colors.black,)),
                  ),
                ),
                Container(
                                    height: 350,
                                    child: CarouselSlider(
                                      options: CarouselOptions(
                                        scrollPhysics: ScrollPhysics(),
                                        viewportFraction: 1,
                                        initialPage: 0,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 3),
                                        autoPlayAnimationDuration: Duration(seconds: 1),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        scrollDirection: Axis.horizontal,
                                        onPageChanged: (index, reason) => {
                                          setState(() {
                                            _current = index;
                                          })
                                        },
                                      ),
                                      items: product.images.map((imgUrl) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: MediaQuery.of(context).size.width,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.all(Radius.circular(12)),
                                                child: Image.network(
                                                  imgUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: product.images.map((url) {
                            int index = photoGalleryprop.indexOf(url);
                            return Container(
                              width: 12,
                              height: 12,
                              margin:
                              EdgeInsets.only(top: 9.0, bottom: 9.0, left: 9),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? Color(0xFFFCBF00)
                                    : Color(0xFF393837),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  
                ]



              )),
              ),

              SliverPadding(padding: EdgeInsets.all(0),
              sliver: SliverList(delegate: SliverChildListDelegate(
                [
                   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Padding(
                              padding: const EdgeInsets.all(25),
                              child: Text(
                                product.arabic_title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontFamily: 'GESSBOLD'),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFFDBA52),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      'EG',
                                      style: TextStyle(
                                          fontFamily: 'LATOLIGHT',
                                          fontSize: 12,
                                          color: Color(0xFF6B6363)),
                                    ),
                                    
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Text(
                                        product.price.toString(),
                                        style: TextStyle(
                                            fontFamily: 'LATOBLACK',
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              product.arabic_description,
                              style: TextStyle(
                                  color: Color(0XFFC6B2B2),
                                  fontFamily: 'GESSLIGHT',
                                  fontSize: 10),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product.properties[0].arabic_title,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'GESSBOLD',
                                    color: Colors.black),
                              ),
                            ),
                            
                          ],
                        ),
                ]
                
              ),),),

              SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 1.8,
                children: product.propertiesItems.map((propertiesItem) => GestureDetector(onTap: (){
                  
                   Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Props(propertiesItem.product_id )),);
                },child: Chossing(propertiesItem.arabic_title, propertiesItem.product_id == product.id),))
                    .toList()
              ),
              SliverPadding(padding: EdgeInsets.all(0),
              sliver: SliverList(delegate: SliverChildListDelegate([
                  SizedBox(height: 30,),
              ]
              )),
              ),

                       






            ],
          ),
        ),

        bottomNavigationBar: product == null ? SizedBox() :  BottomAppBar(

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
                          onTap: (){
                            setState(() {
                            

                            });
                          },
                                              child: Container(
                                                height: 70,
                            width: double.infinity,
                             decoration: BoxDecoration(
                            color: Color(0xFFF6BF0B),
                            borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('اضافة للسلة ',
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
        
      ),
    );
  }
}