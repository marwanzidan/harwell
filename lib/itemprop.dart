import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:harwel1/endingorder.dart';
import 'package:harwel1/main.dart';
import 'package:harwel1/widgets/mainpageitem.dart';

Color selectedbutton = Color(0xFFFDBA52);

List photoGallery = [
  {'imgUrl': 'images/propimg.png'},
{'imgUrl': 'images/propimg.png'},
{'imgUrl': 'images/propimg.png'},
{'imgUrl': 'images/propimg.png'},
{'imgUrl': 'images/propimg.png'},
];
List selectedsize = [
  {
    'size': 'كبير',
    'selected': true,
  },
  {'size': 'صغير', 'selected': false},
];

class Itemproperties extends StatefulWidget {
  @override
  _ItempropertiesState createState() => _ItempropertiesState();
}

class _ItempropertiesState extends State<Itemproperties> {
   int selectedindex =0;
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title: Image(
          image: AssetImage('images/feederlogo.png'),
        ),
          actions: [
          Center(
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              icon: GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Endorder()
                      ),
                      );
                    
                    
                  });
                },
                child: Icon(Icons.shopping_cart,color: Colors.black,)),
              onPressed: () {},
            ),
          )
        ],
        ),
        
        body: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.only(right: 18, left: 18, top: 9),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                      topRight: Radius.circular(11))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 38, right: 50, left: 50),
                        child: Column(
                          children: [
                            CarouselSlider(
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
                              items: photoGallery.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(12)),
                                        child: Image.asset(
                                          i['imgUrl'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: photoGallery.map((url) {
                                  int index = photoGallery.indexOf(url);
                                  return Container(
                                    width: 12.0,
                                    height: 12.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 5.0),
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
                          ],
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Padding(
                          padding: const EdgeInsets.all(25),
                          child: Text(
                            ' بيتزا سوبر سوبريم',
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
                                    '60',
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
                      child: Text(
                        'التفاصيل ',
                        style: TextStyle(
                            color: Color(0XFFC6B2B2),
                            fontFamily: 'GESSLIGHT',
                            fontSize: 10),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'اختر الحجم',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'GESSBOLD',
                                color: Colors.black),
                          ),
                        ),
                        
                      ],
                    ),
                    Container(
                      height: 70,
                      child: GridView.count(
                          crossAxisCount: 4,
                          childAspectRatio: 1.8,
                          children: selectedsize
                              .map((x) => Chossing(x['size'], x['selected']))
                              .toList()),
                    ),

                    
                    SizedBox(
                      height: 30,

                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                         cart.add(12345);

                        });
                      },
                                          child: Container(
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
                  ],
                ),
              ),
            ),
          ),

        ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
         barBackgroundColor: Color(0xFFF79324),
          selectedItemBorderColor: Color(0xFFFDBA52),
          selectedItemBackgroundColor: Color(0xFFFDBA52),
          selectedItemIconColor: Colors.black,
          selectedItemLabelColor: Colors.black,
          unselectedItemIconColor: Colors.white,
          unselectedItemLabelColor: Colors.white
        ),
        selectedIndex: selectedindex,
        onSelectTab: (index) {
          setState(() {
            selectedindex = index;
          });
        },
               items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.search,
            label: 'Search',
          ),
          FFNavigationBarItem(
            iconData: Icons.category,
            label: 'Categories',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'profile',
          ),
         
        
        ],
      ),
      ),
    );
  }
}

class Chossing extends StatelessWidget {
  Chossing(this.sizeno, this.sel);
  final String sizeno;
  final bool sel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: sel ? Color(0xFFFDBA52) : Color(0xFFF5F2EE),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(
              sizeno,
              style: TextStyle(
                  fontFamily: 'LATOBLACK', fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ),
    );
    
  }
}
