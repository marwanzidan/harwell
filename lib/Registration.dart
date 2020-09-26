import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harwel1/login.dart';
import 'package:harwel1/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'main.dart';
import 'models/user.dart';
import 'services/users_service.dart';

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
    // run this function when user click on register buttton

    createUser() async {
      if (_formKey.currentState.validate()) {
        if (name.text.isNotEmpty &&
            phone.text.isNotEmpty &&
            email.text.isNotEmpty &&
            password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });
          User newUser = await UserService().register(
              name: name.text,
              email: email.text,
              password: password.text,
              phone: phone.text);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('access_token', newUser.access_token);
          prefs.setString('name', newUser.name);
          prefs.setString('email', newUser.email);
          prefs.setString('id', newUser.id);
          prefs.setString('phone', newUser.phone);
          setState(() {
            isLoading = false;
          });
          if (newUser == null) {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
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

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Login()));
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image(
                            image: AssetImage(
                              'images/logo.jpg',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'signUpWord'.tr().toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'GESSMED'),
                    ),
                    TextFormField(
                      controller: name,
                      validator: (String value) {
                        return null;
                      },
                      style: textStyle,
                      decoration: getInputDecoration("name".tr().toString()),
                    ),
                    TextFormField(
                      controller: email,
                      validator: (String value) {
                        return null;
                      },
                      style: textStyle,
                      decoration: getInputDecoration("email".tr().toString()),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: password,
                      validator: (String value) {
                        return null;
                      },
                      style: textStyle,
                      decoration:
                          getInputDecoration("password".tr().toString()),
                    ),
                    TextFormField(
                      controller: phone,
                      validator: (String value) {
                        return null;
                      },
                      style: textStyle,
                      decoration: getInputDecoration("phone".tr().toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
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
                    ),
                    isLoading
                        ? SpinKitRotatingCircle(
                            color: Colors.black,
                            size: 50.0,
                          )
                        : InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: createUser,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
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
                                          fontFamily: 'GESSBOLD',
                                          color: Colors.black),
                                    ),
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
        ),
      ),
    );
  }
}
