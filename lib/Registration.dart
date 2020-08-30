import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  // global key for Form
  final _formKey = GlobalKey<FormState>();

  /// textfield Controller
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  // run this function when user click on register buttton
  createUser(){
    if (_formKey.currentState.validate()) {
      print(name.text);
      print(email.text);
      print(password.text);
      print(phone.text);

    }
  }

  TextStyle textStyle = TextStyle(
        fontFamily: 'GESSLIGHT',
          fontSize: 10,
          color: Color(0xFFA8A8A8)
      );

  getInputDecoration(String hintText){
   return InputDecoration(
        hintText: hintText,
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
        );
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Form(
          key: _formKey,
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

                TextFormField(
                  controller: name,
                  validator: (String value) {
                    return null;
                  },
                  style: textStyle,decoration: getInputDecoration("الاسم"),
                ),

                TextFormField(
                  controller: email,
                  validator: (String value) {
                    return null;
                  },
                  style: textStyle,decoration: getInputDecoration("البريد الالكتروني"),
                ),


                TextFormField(
                  controller: password,
                  validator: (String value) {
                    return null;
                  },
                  style: textStyle,decoration: getInputDecoration("كلمة المرور"),
                ),


                TextFormField(
                  controller: phone,
                  validator: (String value) {
                    return null;
                  },
                  style: textStyle,decoration: getInputDecoration("رقم الموبايل"),
                ),

            
              Align(
                alignment: Alignment.centerRight,
                  child: Padding(
                  padding: const EdgeInsets.only(left: 260,top: 20),
                  child: Container(
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
                ),
              ),

            InkWell(
                onTap: createUser,
                child: Padding(
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
             ),
                



              ],
            ),
          ),
        ),
      ),
      
    );
  }
}

