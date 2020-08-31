import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harwel1/Registration.dart';
import 'package:harwel1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './services/category_service.dart';
import 'models/user.dart';
import 'services/users_service.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

    // global key for Form
  final _formKey = GlobalKey<FormState>();

  /// textfield Controller
  final email = TextEditingController();
  final password = TextEditingController();

  bool isLoading = false;

  TextStyle textStyle = TextStyle(
        fontFamily: 'GESSLIGHT',
          fontSize: 15,
          color: Color(0xFF000000)
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

    login() async{

    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState.validate()) {
      User newUser = await UserService().login(email: email.text,password: password.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', newUser.access_token);
      prefs.setString('name', newUser.name);
      prefs.setString('email', newUser.email);
      prefs.setString('id', newUser.id);
      prefs.setString('phone', newUser.phone);
    }

    Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (BuildContext context) => Homestate()));

    setState(() {
      isLoading = false;
    });
  }


    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
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
                    color:Colors.white,
                    fontSize: 25,
                    fontFamily: 'GESSMED'
                ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                    controller: email,
                    validator: (String value) {
                      return null;
                    },
                    style: textStyle,decoration: getInputDecoration("البريد الالكتروني"),
                ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                    obscureText: true,
                    controller: password,
                    validator: (String value) {
                      return null;
                    },
                    style: textStyle,decoration: getInputDecoration("كلمة المرور"),
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
                    onTap: login,
                child: isLoading ? SpinKitRotatingCircle(
                    color: Colors.black,
                    size: 50.0,
                ) : Container(
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Registration()
                            ),
                            );
                      });
                    }
                     ,
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
      ),
      
    );
  }
}