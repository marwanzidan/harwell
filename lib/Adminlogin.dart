import 'package:flutter/material.dart';

class Adminlogin extends StatefulWidget {
  @override
  _AdminloginState createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  getInputDecoration(String hintText){
   return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'GESSMED',
          fontSize: 16,
          color: Colors.white
        ),
        enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
        color: Colors.white
          ),
          ),
        );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(

          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
              child: Column(

                children: [
                  Image(image: AssetImage('images/logoBlack.png')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Sell it fast',
                    style: TextStyle(
                      fontFamily: 'LATOLIGHT',
                      fontSize: 20,
                      color: Color(0xFF9A9595)
                    ),),
                    
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                                      child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text('الدخول',
                      style: TextStyle(color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'GESSBOLD'
                      ),  ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      decoration: getInputDecoration('اسم المستخدم'),


                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      decoration: getInputDecoration('كلمة المرور '),


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Container(
                        width: double.infinity,
                         decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Text('تسجيل الدخول',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'GESSMED',
                            color : Colors.black
                          ),),
                        ),
                        ),

                              ),
                  ),



                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}