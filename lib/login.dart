import 'package:flutter/material.dart';
import 'package:harwel1/Registration.dart';
import 'package:harwel1/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(image: AssetImage('images/feederbiglogo.png')),
              )),
              Align(
                alignment: Alignment.centerRight,
                          child: Text('تسجيل الدخول',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 25,
                  fontFamily: 'GESSMED'
                ),
                ),
              ),
              TextField(
              style: TextStyle(
                fontFamily: 'GESSLIGHT',
                  fontSize: 10,
                  color: Color(0xFFA8A8A8)
              ),
              
              
              decoration: InputDecoration(
                
                
                
                
                
                hintText: 'البريد الالكتروني',
                hintStyle: TextStyle(
                  fontFamily: 'GESSLIGHT',
                  fontSize: 15,
                  color: Color(0xFFA8A8A8)

                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFA8A8A8)

                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                style: TextStyle(
                  fontFamily: 'GESSLIGHT',
                    fontSize: 10,
                    color: Color(0xFFA8A8A8)
                ),
                
                
                decoration: InputDecoration(
                  
                  
                  
                  
                  
                  hintText: 'كلمة المرور',
                  hintStyle: TextStyle(
                    fontFamily: 'GESSLIGHT',
                    fontSize: 15,
                    color: Color(0xFFA8A8A8)

                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                       color: Color(0xFFA8A8A8)

                    ),
                  ),

                ),
              ),
            ),

            Container(
              
                width: 150,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(5),
                  color : Colors.black,
                  border: Border.all(
                    color: Colors.white
                  )

                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                   
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

                      Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Homestate()
                          ),
                          );
                    });
                  },
                                  child: Container(
                    width: double.infinity,
                     decoration: BoxDecoration(
                    color: Color(0xFFF6BF0B),
                    borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Text('تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'GESSBOLD',
                        color : Colors.black
                      ),),
                    ),
            ),

                  ),
                ),
              ),
                        Padding(
                 padding: const EdgeInsets.symmetric(vertical: 15),
                child: GestureDetector(
                   onTap: (){
                    setState(() {
                      
                      Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Registration()
                          ),
                          );
                    });
                  },
                                  child: Container(
                    width: double.infinity,
                     decoration: BoxDecoration(
                    color: Color(0xFFF6BF0B),
                    borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Text('التسجيل ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'GESSBOLD',
                        color : Colors.black
                      ),),
                    ),
            ),

                  ),
                ),
              ),



            ],
          ),
        ),
      ),
      
    );
  }
}