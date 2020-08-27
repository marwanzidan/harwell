import 'package:flutter/material.dart';
import 'package:harwel1/main.dart';
import 'package:harwel1/mainpage.dart';

class Orderdone extends StatefulWidget {
  @override
  _OrderdoneState createState() => _OrderdoneState();
}

class _OrderdoneState extends State<Orderdone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Image(
          image: AssetImage('images/feederlogo.png'),
        ),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Center(child: Icon(Icons.check_circle,size : 100,color: Color(0xFFFDBE00),)),
           Text('تم تأكيد الطلب بنجاح',
           style: TextStyle(
             fontSize: 30,
             fontFamily: 'GESSLIGHT',
             color: Colors.black

           ),),
           Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFDBA52),
                    borderRadius: BorderRadius.circular(5)

                  ),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        
                         Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Homestate()
                        ),
                        );
                      });
                    },
                                      child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      child: Text('انهاء',
                      style: TextStyle(
                        fontFamily: 'GESSBOLD',
                        fontSize: 15,
                        color: Colors.black
                      

                      ),),
                    ),
                  ),


                ),
                              ),
         ],
       ),


      
    );
  }
}