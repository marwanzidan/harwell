import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harwel1/login.dart';
import 'package:harwel1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = '';

  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('access_token');
    if (token == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    } else {
      print(token);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Homestate()));
    }
  }

  @override
  void initState() {
    Timer _timer;
    int _start = 2;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            checkLogin();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image(image: AssetImage('images/feederbiglogo.png')),
      )),
    ));
  }
}
