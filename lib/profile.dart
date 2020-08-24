import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
               Topprofileicons( FontAwesomeIcons.cubes,'طلباتي'),
                 Topprofileicons( FontAwesomeIcons.solidHeart,'قائمة الامنيات'),
              Topprofileicons( FontAwesomeIcons.user,'الاعدادات'),
            
             
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('روابط اخري',
            style : TextStyle(
              fontFamily: 'GESSMED',
              fontSize: 20,
              color: Colors.white
            )),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Otherlinks('عن هرول'),
        ),

        Divider(
          color: Colors.white,
          thickness: 2,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Otherlinks('الشروط والاحكام'),
        ),
         Divider(
          color: Colors.white,
          thickness: 2,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Otherlinks('سياسة الخصوصية والاستبدال'),
        ),
         Divider(
          color: Colors.white,
          thickness: 2,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Otherlinks('الأسئلة المكررة'),
        ),
         Divider(
          color: Colors.white,
          thickness: 2,
        ),
          ],

        ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
               decoration: BoxDecoration(
              color: Color(0xFFF6BF0B),
              borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('تسجيل الخروج',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'GESSBOLD',
                color : Colors.black
              ),),
            ),
        ),

            ),
          ),
          

      ],
      
      
    );
   
  }
}

class Otherlinks extends StatelessWidget {
Otherlinks(this.txt);

final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       
        Text(txt,
        style : TextStyle(
          fontFamily: 'GESSLIGHT',
          fontSize: 20,
          color: Colors.white
        )),
         Icon(Icons.keyboard_arrow_left,size: 20,),

      ],
    );
  }
}

class Topprofileicons extends StatelessWidget {
  
  Topprofileicons(this.ic,this.ictxt);
  final String ictxt;
  final IconData ic;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFF6BF0B),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 19),
          child: Column(
              children: [
                FaIcon(ic,color:Colors.black,size : 40),
                Text(ictxt,
                style: TextStyle(
                  fontFamily: 'GESSBOLD',
                  fontSize: 15,
                  color: Colors.black
                ),
                )
              ],
          ),
        ),
      ),
          ),
    );
  }
}