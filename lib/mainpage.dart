import 'package:flutter/material.dart';
import 'package:harwel1/main.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:harwel1/widgets/mainpageitem.dart';


class MainPage extends StatefulWidget {
  final selectItemHandler;
  MainPage({this.selectItemHandler});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print(width == 500);
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                // SizedBox(height: 20,),
                Container(
                  height: 350,
                  child: CarouselSlider(
                    
                    options: CarouselOptions(
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
                    items: photoGallery.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              i['imgUrl'],
                              fit: BoxFit.cover,
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
                      children: photoGallery.map((url) {
                        int index = photoGallery.indexOf(url);
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
                
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SliverGrid.count(
            crossAxisCount: width > 700 ? 4  : 2,
            childAspectRatio: width > 700 ? 0.7  : 1 ,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
            children: products
                .map(
                  (e) => MainPageItem(
                    name: e['name'],
                    image: e['imgUrl'],
                    shortDescription: e['shortDescription'],
                    price: e['price'],
                    handler: widget.selectItemHandler
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}