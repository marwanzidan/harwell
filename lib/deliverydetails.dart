import 'package:flutter/material.dart';

class Delvdetails extends StatefulWidget {
  @override
  _DelvdetailsState createState() => _DelvdetailsState();
}

class _DelvdetailsState extends State<Delvdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(11)

        ),
        child: Column(
          children: [
            Details('العنوان'),
            Details('اسم الشارع'),
            Details('رقم المبني'),
            Details('رقم الشقة'),
             Details('ملاحظات علي العنوان'),
          ],
        ),

      ),
      
    );
  }
}

class Details extends StatelessWidget {

Details(this.txt);

final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextField(
        decoration: InputDecoration(
          hintText: txt,
          hintStyle: TextStyle(
            fontFamily: 'GESSLIGHT',
            fontSize: 10,
            color: Color(0xFF9C9696)

          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF9C9696)
            )
          )
        ),


      ),
    );
  }
}