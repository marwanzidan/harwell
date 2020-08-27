import 'package:flutter/material.dart';
import 'package:harwel1/main.dart';
import 'package:harwel1/paybill.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Image(
          image: AssetImage('images/feederlogo.png'),
        ),
       ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[ SingleChildScrollView(
                          
        child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
              alignment: Alignment.topRight,
                          child: Text('تفاصيل التوصيل',style: 
              TextStyle(
                  fontFamily: 'GESSLIGHT',
                  fontSize: 30,
                  color: Colors.black

              
              ),),
            ),
                ),
                
                Container(
                  width: double.infinity,
                   height: 460,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(11)

              ),
              child: Column(
                          children:[ 
                            Align(
                              alignment: Alignment.centerRight,
                                                      child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Addresstxt('اختر عنوان التوصيل'),
                ),
                            ),
                            
                            Column(
                  
                  children : address.map((x) => 
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0XFFEFD7D7)
                      )
                    ),
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       

                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Column(
                            children: [
                               Addresstxt(x['street']),
                       Addresstxt(x['building no']),
                          Addresstxt(x['app no'])
                            ],

                          ),
                        ),
                         Icon(Icons.verified_user,color: Colors.black,),
                      ],

                    ),

                  ),
                  
                  
                  ).toList()
                ),

                
                ],
              ),
                ),
              ],
        ),
        
      ),
       
                        ],
                        
            ),
          ),

          bottomNavigationBar: BottomAppBar(
       
       child:  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 13),
         child: GestureDetector(
            onTap: (){
         setState(() {
           
           Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Billdetails()
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

class Addresstxt extends StatelessWidget {
 
Addresstxt(this.txt);
 final String txt;

  @override
  Widget build(BuildContext context) {
    return Text(txt,style: TextStyle(
      color : Colors.black,
      fontFamily: 'GESSBOLD',
      fontSize: 10
    ),);
  }
}