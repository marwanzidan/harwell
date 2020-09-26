import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harwel1/Adminlogin.dart';
import 'package:harwel1/Registration.dart';
import 'package:harwel1/address.dart';
import 'package:harwel1/categories.dart';
import 'package:harwel1/deliverydetails.dart';
import 'package:harwel1/endingorder.dart';
import 'package:harwel1/itemprop.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:harwel1/login.dart';
import 'package:harwel1/mainpage.dart';
import 'package:harwel1/models/category.dart';
import 'package:harwel1/myAccountMenu.dart';
import 'package:harwel1/myorder.dart';
import 'package:harwel1/orderdone.dart';
import 'package:harwel1/paybill.dart';
import 'package:harwel1/profile.dart';
import 'package:harwel1/search.dart';
import 'package:harwel1/services/category_service.dart';
import 'package:harwel1/splash.dart';
import 'endingorder.dart';
import 'dart:ui' as ui;

void main() {
  runApp(
    EasyLocalization(
      child: MyApp(),
      path: "resources/langs",
      saveLocale: true,
      supportedLocales: [
        Locale('ar', 'AR'),
        Locale('en', 'EN'),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HAROOL',
      theme: ThemeData(
        fontFamily: EasyLocalization.of(context).locale == Locale('ar', 'AR')
            ? 'GESSMED'
            : 'LATOREGULAR',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white, centerTitle: true),
        iconTheme: IconThemeData(color: Colors.white),
        accentColor: Color(0xFFFDBA52),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: Colors.black),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        return Directionality(
          textDirection:
              EasyLocalization.of(context).locale == Locale('ar', 'AR')
                  ? ui.TextDirection.rtl
                  : ui.TextDirection.ltr,
          child: child,
        );
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SafeArea(child: SplashScreen()),
    );
  }
}

List cart = [];
List cartIds = [];

List photoGalleryprop = [
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

List orders = [
  {
    'order no': '#123',
    'date': '23/8/2020',
    'time': '5:20 pm',
    'the order': 'كوتشي نايك رجالي',
    'delivery fees': '200 جنيه',
    'total': '10 جنيه',
    'address': ' المعادي'
  },
  {
    'order no': '#123',
    'date': '23/8/2020',
    'time': '5:20 pm',
    'the order': 'كوتشي نايك رجالي',
    'delivery fees': '200 جنيه',
    'total': '10 جنيه',
    'address': ' المعادي'
  },
  {
    'order no': '#123',
    'date': '23/8/2020',
    'time': '5:20 pm',
    'the order': 'كوتشي نايك رجالي',
    'delivery fees': '200 جنيه',
    'total': '10 جنيه',
    'address': ' المعادي'
  },
];

List addresshardcoded = [
  {
    'street': 'شارع الملك خالد',
    'building no': 'مبني 43',
    'app no': 'شقة 3',
    'details': 'بجوار بقالة المحمودية',
    'country': 'السعودية'
  },
  {
    'street': 'شارع الملك خالد',
    'building no': 'مبني 43',
    'app no': 'شقة 3',
    'details': 'بجوار بقالة المحمودية',
    'country': 'السعودية'
  },
  {
    'street': 'شارع الملك خالد',
    'building no': 'مبني 43',
    'app no': 'شقة 3',
    'details': 'بجوار بقالة المحمودية',
    'country': 'السعودية'
  },
];

List billdetails = [
  {
    'total before': '175',
    'discount': '10',
    'delivery': ' 20',
    'Tax': '140',
    'total after': '300'
  }
];

List photoGallery = [
  {
    'imgUrl': 'images/Image 2.png',
  },
  {
    'imgUrl': 'images/Image 2.png',
  },
  {
    'imgUrl': 'images/Image 2.png',
  },
];

List products = [
  {
    'name' : ' حذاء رياضي تجريبي',
    'imgUrl' : 'images/Image 4.png',
    'shortDescription' : ' وصف تجريبي  ',
    'price' : ' 60'

  },
  {
    'name' : '  تجربة تجربة',
    'imgUrl' : 'images/Image 4.png',
    'shortDescription' : ' وصف تجريبي ',
    'price' : ' 150'

  },
  {
    'name' : ' حذاء رياضي',
    'imgUrl' : 'images/Image 4.png',
    'shortDescription' : ' وصف تجريبي ',
    'price' : ' 60'

  },

];

class Homestate extends StatefulWidget {
  @override
  _HomestateState createState() => _HomestateState();
}

class _HomestateState extends State<Homestate> {
  int selectedindex = 0;
  testttt() {
    setState(() {
      selectedindex = 4;
    });
  }

  List views = [
    Searchscreen(),
    Categories(),
    Profile(),
    Itemproperties(),
  ];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: HomePageDrawer(),
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
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Endorder()),
                        );
                      });
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    )),
                onPressed: () {},
              ),
            ),
            Center(
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                icon: GestureDetector(
                    onTap: () {
                      setState(() {
                        EasyLocalization.of(context).locale ==
                                Locale('ar', 'AR')
                            ? EasyLocalization.of(context).locale =
                                Locale('en', 'EN')
                            : EasyLocalization.of(context).locale =
                                Locale('ar', 'AR');
                      });
                    },
                    child: Icon(
                      FontAwesomeIcons.language,
                      color: Colors.black,
                    )),
                onPressed: () {},
              ),
            ),
            Center(
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                icon: GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState.openEndDrawer();
                    },
                    child: Icon(
                      FontAwesomeIcons.bars,
                      color: Colors.black,
                    )),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: selectedindex == 0
            ? MainPage(
                selectItemHandler: testttt,
              )
            : selectedindex == 1
                ? Searchscreen(selectItemHandler: testttt)
                : selectedindex == 2
                    ? Categories()
                    : selectedindex == 3
                        ? Profile()
                        : selectedindex == 4
                            ? Itemproperties()
                            : SizedBox(),
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
              barBackgroundColor: Color(0xFFF79324),
              selectedItemBorderColor: Color(0xFFFDBA52),
              selectedItemBackgroundColor: Color(0xFFFDBA52),
              selectedItemIconColor: Colors.black,
              selectedItemLabelColor: Colors.black,
              unselectedItemIconColor: Colors.white,
              unselectedItemLabelColor: Colors.white),
          selectedIndex: selectedindex,
          onSelectTab: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.home,
              label: '',
            ),
            FFNavigationBarItem(
              iconData: Icons.search,
              label: '',
            ),
            FFNavigationBarItem(
              iconData: Icons.person,
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageDrawer extends StatefulWidget {
  @override
  _HomePageDrawerState createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  bool loadingSideBar = false;
  getCategories() async {
    setState(() {
      loadingSideBar = true;
    });
    var categories = await CategoryService().getListOfCategories();
    setState(() {
      loadingSideBar = false;
      categoriesList = categories;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'menu'.tr().toString(),
            style: TextStyle(
              fontFamily: 'GESSMED',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: loadingSideBar
                  ? [
                      SpinKitPouringHourglass(
                        color: Colors.black,
                      )
                    ]
                  : [
                      Container(
                        color: Colors.grey.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    child: RaisedButton(
                                      color: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      elevation: 0,
                                      highlightElevation: 0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Login()),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    child: RaisedButton(
                                      color: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      elevation: 0,
                                      highlightElevation: 0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      child: Text('Sign Up'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Registration()),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              ...categoriesList
                                  .map((e) => Column(
                                        children: [
                                          ListTile(
                                              title: Text(
                                            e.arabic_title,
                                            style: TextStyle(
                                                fontFamily: 'GESSMED'),
                                          )),
                                          Divider(height: 5)
                                        ],
                                      ))
                                  .toList(),
                              ListTile(
                                  title: Text(
                                'شركه اوردري للشحن',
                                style: TextStyle(fontFamily: 'GESSMED'),
                              )),
                              Divider(height: 5)
                            ],
                          ),
                        ),
                      )
                    ]),
        ),
      ),
    );
  }
}

List<Category> categoriesList;
