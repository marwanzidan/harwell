import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Adminlogin extends StatefulWidget {
  @override
  _AdminloginState createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  getInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle:
          TextStyle(fontFamily: 'GESSMED', fontSize: 16, color: Colors.white),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image(image: AssetImage('images/logoBlack.png'))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sell it fast',
                      style: TextStyle(
                          fontFamily: 'LATOLIGHT',
                          fontSize: 20,
                          color: Color(0xFF9A9595)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'signIn'.tr().toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'GESSBOLD'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      decoration:
                          getInputDecoration('userName'.tr().toString()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      decoration:
                          getInputDecoration('password'.tr().toString()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Text(
                            'signIn'.tr().toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'GESSMED',
                                color: Colors.black),
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
    );
  }
}
