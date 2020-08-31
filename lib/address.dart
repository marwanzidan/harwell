import 'package:flutter/material.dart';
import 'package:harwel1/main.dart';
import 'package:harwel1/paybill.dart';
import 'package:harwel1/services/Address_service.dart';

import './models/Address.dart';
import 'main.dart';


class Address1 extends StatefulWidget {
  @override
  _Address1State createState() => _Address1State();
}

class _Address1State extends State<Address1> {
   List<Address> addresslist;
getaddress() async {
    var address = await Addressservice().getListOfaddress();
    setState(() {
      addresslist = address;
    });
  }

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getaddress();
  }

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
                  
                  children : addresslist == null ? [Text("جاري التحميل")] :
                   addresslist.map((x) => 
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
                              Addresstxt(x.address),
                              Addresstxt(x.street_name),
                              Addresstxt(x.building_number),
                              Addresstxt(x.apartement_number),
                              Addresstxt(x.notes),
                              Addresstxt(x.region_id)
                            
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