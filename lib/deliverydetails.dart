import 'package:flutter/material.dart';
import 'package:harwel1/address.dart';
import 'package:harwel1/main.dart';

class Delvdetails extends StatefulWidget {
  @override
  _DelvdetailsState createState() => _DelvdetailsState();
}

class _DelvdetailsState extends State<Delvdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage('images/feederlogo.png'),
        ),
       ),
      body:CustomScrollView(
        slivers: <Widget> [

          SliverPadding(padding: EdgeInsets.all(0),
          sliver: SliverList(delegate: SliverChildListDelegate(

            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Align(
              alignment: Alignment.topRight,
                        child: Text('تفاصيل التوصيل',style: 
              TextStyle(
                fontFamily: 'GESSLIGHT',
                fontSize: 30,
                color: Colors.black

              
              ),),
          ),
           Container(
        height: 460,
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
     

        ],
      ),
              ),
            ]
          )
          
          ),
          
          
          
          )
        ]
        
        

      ),
      bottomNavigationBar: BottomAppBar(
       
       child:  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 13),
         child: GestureDetector(
            onTap: (){
         setState(() {
           
           Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Address()
               ),
               );
         });

            },
                   child: Container(
         width: double.infinity,
         height: 70,
          decoration: BoxDecoration(
         color: Color(0xFFF6BF0B),
         borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
         child: Padding(
           padding: const EdgeInsets.all(20),
           child: Text('تأكيد ',
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
      
    );
  }
}


 

class Details extends StatelessWidget {

Details(this.txt);

final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
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