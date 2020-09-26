import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harwel1/Registration.dart';
import 'package:harwel1/main.dart';
import 'package:harwel1/orderwithoutLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './services/category_service.dart';
import 'models/user.dart';
import 'services/users_service.dart';
import 'package:easy_localization/easy_localization.dart';

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
      fontFamily: 'GESSLIGHT', fontSize: 15, color: Color(0xFF000000));

  getInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
          fontFamily: 'GESSLIGHT', fontSize: 15, color: Color(0xFFA8A8A8)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFA8A8A8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    login() async {
      if (_formKey.currentState.validate()) {
        if (email.text.isNotEmpty && password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });
          User newUser = await UserService().login(
              email: email.text, password: password.text, context: context);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          if (newUser.access_token == null) {
            print(newUser.access_token);
            setState(() {
              isLoading = false;
            });
          } else {
            print('x');
            setState(() {
              print(newUser.access_token);
              prefs.setString('access_token', newUser.access_token);
              prefs.setString('name', newUser.name);
              prefs.setString('email', newUser.email);
              prefs.setString('id', newUser.id);
              prefs.setString('phone', newUser.phone);
              isLoading = false;
            });
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Homestate()));
          }
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image(image: AssetImage('images/logo.jpg')),
                    )),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'GESSMED'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: email,
                      validator: (String value) {
                        return null;
                      },
                      style: textStyle,
                      decoration: getInputDecoration("email".tr().toString()),
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
                      style: textStyle,
                      decoration:
                          getInputDecoration("password".tr().toString()),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'supportedBy'.tr().toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'GESSLIGHT',
                                fontSize: 12),
                          ),
                          Image(image: AssetImage('images/osicon.png'))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: login,
                      child: isLoading
                          ? SpinKitWanderingCubes(
                              color: Colors.black,
                              size: 50.0,
                            )
                          : Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF6BF0B),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Text(
                                    'signIn'.tr().toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'GESSMED',
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Registration()),
                          );
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFF6BF0B),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(13),
                            child: Text(
                              'signUp'.tr().toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OrderWithoutLogin()),
                          );
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFF6BF0B),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(13),
                            child: Text(
                              'orderNoLogin'.tr().toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      EasyLocalization.of(context).locale == Locale('ar', 'AR')
                          ? EasyLocalization.of(context).locale =
                              Locale('en', 'EN')
                          : EasyLocalization.of(context).locale =
                              Locale('ar', 'AR');
                    },
                    child: Center(
                      child: Text(
                        'changeLang'.tr().toString() + 'lang'.tr().toString(),
                        style: TextStyle(
                            fontFamily: EasyLocalization.of(context).locale ==
                                    Locale('ar', 'AR')
                                ? 'LATOBLACK'
                                : 'GESSMED'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
