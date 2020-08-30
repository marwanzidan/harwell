import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harwel1/myorder.dart';


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
               Expanded(
                                child: GestureDetector(
                   onTap: (){
                     setState(() {
                         Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Myorders()
                        ),
                        );
                     });
                   },
                   child: Topprofileicons( FontAwesomeIcons.cubes,'طلباتي')),
               ),
              //    Expanded(child: Topprofileicons( FontAwesomeIcons.solidHeart,'قائمة الامنيات')),
              // Expanded(child: Topprofileicons( FontAwesomeIcons.user,'الاعدادات')),
            
             
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('وصف المطعم',
            style : TextStyle(
                  fontFamily: 'GESSMED',
                  fontSize: 20,
                  color: Colors.black
                )),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('هذا المطعم يقوم بتقديم جميع انواع البيتزا والفطائر والمشروبات ',
          style : TextStyle(
                fontFamily: 'GESSLIGHT',
                fontSize: 15,
                color: Colors.black
              ),
          ),
        ),

      //   Align(
      //     alignment: Alignment.centerRight,
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text('روابط اخري',
      //       style : TextStyle(
      //         fontFamily: 'GESSMED',
      //         fontSize: 20,
      //         color: Colors.black
      //       )),
      //     ),
      //   ),

      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Otherlinks('عن هرول'),
      //   ),

      //  Divider(
      //     color: Color(0xFFF0F0F0),
      //     thickness: 2,
      //   ),

      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Otherlinks('الشروط والاحكام'),
      //   ),
      //    Divider(
      //     color: Color(0xFFF0F0F0),
      //     thickness: 2,
      //   ),

      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Otherlinks('سياسة الخصوصية والاستبدال'),
      //   ),
      //   Divider(
      //     color: Color(0xFFF0F0F0),
      //     thickness: 2,
      //   ),

      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Otherlinks('الأسئلة المكررة'),
      //   ),
      //   Divider(
      //     color: Color(0xFFF0F0F0),
      //     thickness: 2,
      //   ),
        Padding(
              padding: const EdgeInsets.only(top: 20,left: 140,right: 140),
              child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color : Colors.black,
                    border: Border.all(
                      color: Colors.white
                    )

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     
                      children: [
                        Text('مدعوم بواسطة',
                        style: TextStyle(
              color: Colors.white,
              fontFamily: 'GESSLIGHT',
              fontSize: 12
                        ),
                        ),
                        Image(image: AssetImage('images/osicon.png'))
                      ],
                    ),
                  ),


                ),
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
          color: Colors.black
        )),
         Icon(Icons.keyboard_arrow_left,size: 20,color: Colors.black,),

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
    return Padding(
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
    );
  }
}