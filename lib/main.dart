import 'package:flutter/material.dart';
import 'package:harwel1/Adminlogin.dart';
import 'package:harwel1/adminorders.dart';
import 'package:harwel1/categories.dart';
import 'package:harwel1/endingorder.dart';
import 'package:harwel1/itemprop.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:harwel1/mainpage.dart';
import 'package:harwel1/profile.dart';
import 'package:harwel1/login.dart';
import 'package:harwel1/search.dart';
import 'login.dart';
import 'login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'HAROOL',
      theme: ThemeData(
        fontFamily: 'GESSMEDIUM',
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
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      home: Homestate(),
    );
  }
}

List cart =[
  

];

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


List orders= [
  {
    'order no' : '#123',
    'date' : '23/8/2020',
    'time' : '5:20 pm',
    'the order' : 'بيتزا خضار',
    'delivery fees' : '200 جنيه',
    'total' : '10 جنيه',
    'address' : ' المعادي'

  },
   {
    'order no' : '#123',
    'date' : '23/8/2020',
    'time' : '5:20 pm',
    'the order' : 'بيتزا خضار',
    'delivery fees' : '200 جنيه',
    'total' : '10 جنيه',
    'address' : ' المعادي'

  },
   {
    'order no' : '#123',
    'date' : '23/8/2020',
    'time' : '5:20 pm',
    'the order' : 'بيتزا خضار',
    'delivery fees' : '200 جنيه',
    'total' : '10 جنيه',
    'address' : ' المعادي'

  },


];


List addresshardcoded = [

  {
    'street' : 'شارع الملك خالد',
    'building no' : 'مبني 43',
    'app no' : 'شقة 3',
    'details' : 'بجوار بقالة المحمودية',
    'country' : 'السعودية'

  },
  {
    'street' : 'شارع الملك خالد',
    'building no' : 'مبني 43',
    'app no' : 'شقة 3',
    'details' : 'بجوار بقالة المحمودية',
    'country' : 'السعودية'

  },
  {
    'street' : 'شارع الملك خالد',
    'building no' : 'مبني 43',
    'app no' : 'شقة 3',
    'details' : 'بجوار بقالة المحمودية',
    'country' : 'السعودية'

  },

];

List billdetails = [
  { 
    'total before' : '175 ريال سعودي',
    'discount' : '10 ريال',
    'delivery' : ' 20 ريال',
    'Tax' : '140 ريال ',
    'total after' : '300 ريال'

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

List products=[
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
   int selectedindex =0;
   testttt(){
     setState(() {
       
       selectedindex =4;
     });
   }


  List views =[
    Searchscreen(),
    Categories(),
    Profile(),
    Itemproperties(),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: selectedindex == 0 ?  MainPage(selectItemHandler: testttt,)
       : selectedindex == 1 ? Searchscreen(selectItemHandler: testttt)
       :selectedindex == 2 ?Categories()
       :selectedindex ==3?Profile()
       :selectedindex ==4? Itemproperties() : SizedBox(),
    
     

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
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.search,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.category,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: '',
          ),
         
        ],
      ),

      

      
      
    );
  }
}

