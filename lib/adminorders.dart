// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// List orderdetailsadmin=[
// {
//   'order no' : '#123',
//     'date' : '23/8/2020',
//     'time' : '5:20 pm',
//     'the order' : 'بيتزا خضار',
//     'delivery fees' : '200 جنيه',
//     'total' : '10 جنيه',
//     'address' : ' المعادي',
//      'total before' : '175 ريال سعودي',
//     'discountcode' : '10 ريال',
//     'delivery' : ' 20 ريال',
//     'Tax' : '140 ريال ',
//     'total after' : '300 ريال',
//      'street' : 'شارع الملك خالد',
//     'building no' : 'مبني 43',
//     'Address' : 'الحي الاول بجوار دجاجنا',
//     'customername' : 'احمد محمد',
//     'phoneno' : '01157501669'
// }
  
// ];


// class Adminorders extends StatefulWidget {
//   @override
//   _AdminordersState createState() => _AdminordersState();
// }

// class _AdminordersState extends State<Adminorders> {
//   bool state1=false;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//               body: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: CustomScrollView(
//                   slivers:<Widget> [
//                     SliverPadding(padding: EdgeInsets.all(0),
//                     sliver: SliverList(delegate: SliverChildListDelegate (
//                       [

//                          Column(
//                              children: [
//                                Row(
//                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  children: [
//                                  Row(children: [
//                                    Image(image: AssetImage('images/osaleicon.png'),),
//                                    Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: Text('prime',
//                                      style: TextStyle(fontFamily: 'LATOLIGHT',fontSize: 20,color: Colors.black),),
//                                    ),
                                   
//                                  ],),
//                                  Icon(FontAwesomeIcons.bars,color: Colors.black,size: 20,),
                                 


//                                ],),

//                                Padding(
//                                  padding: const EdgeInsets.symmetric(vertical: 20),
//                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                    children: [
//                                    Text('الطلبات',
//                                    style: TextStyle(
//                                      fontSize: 30,
//                                      fontFamily: 'GESSBOLD',
//                                      color: Colors.black
//                                    ),),

//                                    Row(children: [
//                                      Text('حالة الطلب',
//                                      style: TextStyle(
//                                        fontFamily: 'GESSMED',
//                                        fontSize: 12,
//                                        color: Color(0xFFADA1A1)
//                                      ),),

//                                      Switch(value: state1, onChanged:(bool s){
//                                       setState(() {
//                                          state1=s;
//                                        print(state1);
//                                       });
//                                      }),
//                                      Text('حالي',
//                                      style: TextStyle(
//                                        fontSize: 12,
//                                        fontFamily: 'GESSBOLD'
//                                      ),)
//                                    ],),


//                                  ],),

//                                ),
                               
//                              ],
//                          ),
//                       ]


                      
//                     )
                    
                    
//                     ),
//                     ),
//                     SliverPadding(padding: EdgeInsets.all(0),
//                     sliver: SliverGrid.count(crossAxisCount: 1,
//                     children: orderdetailsadmin.map((e) => 
//                     Container(
//                       decoration: BoxDecoration(
                     
//                       ),
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerRight,
//                                                     child: Text(e['order no'],
//                             style: TextStyle(
//                               fontFamily: 'GESSMED',
//                               fontSize: 15,
                            
//                             ),),
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                                                       child: Text(e['the order'],
//                             style: TextStyle(
//                               fontFamily: 'GESSLIGHT',
//                               fontSize: 13,
                            
//                             ),),
//                           ),
//                           Divider(color: Color(0xFFF7E7E7),
//                           thickness: 1,),
//                           Row(children: [
//                             Text('كود الخصم ',
//                             style: TextStyle(
//                               fontFamily: 'GESSMED',
//                               fontSize: 12,
//                               color: Color(0xFFADA1A1)
                            
//                             ),),Padding(
//                               padding: const EdgeInsets.only(right: 8),
//                               child: Text(e['discountcode'],
//                               style: TextStyle(
//                                 fontFamily: 'GESSLIGHT',
//                                 fontSize: 12,
                              
//                               ),),
//                             ),
//                           ],),
//                            Fees(),
//                           //  Row(children: [
//                           //   Text(' خدمة التوصيل ',
//                           //   style: TextStyle(
//                           //     fontFamily: 'GESSMED',
//                           //     fontSize: 12,
//                           //     color: Color(0xFFADA1A1)
                            
//                           //   ),),Padding(
//                           //      padding: const EdgeInsets.only(right: 8),
//                           //     child: Text(e['delivery'],
//                           //     style: TextStyle(
//                           //       fontFamily: 'GESSLIGHT',
//                           //       fontSize: 12,
                              
//                           //     ),),
//                           //   ),
//                           // ],),
//                           //  Row(children: [
//                           //   Text('الضريبة  ',
//                           //   style: TextStyle(
//                           //     fontFamily: 'GESSMED',
//                           //     fontSize: 12,
//                           //     color: Color(0xFFADA1A1)
                            
//                           //   ),),Padding(
//                           //     padding: const EdgeInsets.only(right: 8),
//                           //     child: Text(e['Tax'],
//                           //     style: TextStyle(
//                           //       fontFamily: 'GESSLIGHT',
//                           //       fontSize: 12,
                              
//                           //     ),),
//                           //   ),
//                           // ],),


//                         ],
//                       ),
//                     )
//                     ).toList(),
//                     ),
//                     ),
                    
//                   ],
          
//         ),
//               ),
//       ),
      
//     );
//   }
// }

// class Fees extends StatelessWidget {
// Fees(this.textlabel,this.textfees);

// final String textlabel;
// final String textfees;

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: [
//      Text('الاجمالي ',
//      style: TextStyle(
//        fontFamily: 'GESSMED',
//        fontSize: 12,
//        color: Color(0xFFADA1A1)
     
//      ),),Padding(
//         padding: const EdgeInsets.only(right: 8),
//        child: Text(e['total before'],
//        style: TextStyle(
//          fontFamily: 'LATOLIGHT',
//          fontSize: 12,
       
//        ),),
//      ),
//                           ],);
//   }
// }