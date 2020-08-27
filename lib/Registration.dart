import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.all(13.0),
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
                  color:Colors.black,
                  fontSize: 25,
                  fontFamily: 'GESSMED'
                ),
                ),
              ),
              Info(' الاسم'),
               Info(' كلمة المرور'),
                Info(' رقم الموبايل'),
                 Info('البريد الالكتروني'),
            

            Padding(
              padding: const EdgeInsets.only(left: 260,top: 20),
              child: Container(

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
            ),

                      Padding(
                padding: const EdgeInsets.symmetric(vertical : 15),
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
              



            ],
          ),
        ),
      ),
      
    );
  }
}

class Info extends StatelessWidget {
  Info(this.txt);
  
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical : 8.0),
      child: TextField(
      style: TextStyle(
        fontFamily: 'GESSLIGHT',
          fontSize: 10,
          color: Color(0xFFA8A8A8)
      ),
      
      
      decoration: InputDecoration(
        
        
        
        
        
        hintText: txt,
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
    );
  }
}