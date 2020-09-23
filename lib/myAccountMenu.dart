import 'package:flutter/material.dart';

class MyAccountMenu extends StatefulWidget {
  @override
  _MyAccountMenuState createState() => _MyAccountMenuState();
}

class _MyAccountMenuState extends State<MyAccountMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.3),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'My Account',
              style: TextStyle(
                fontFamily: 'GESSMED',
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                    title: Text(
                                  'Help',
                                  style: TextStyle(fontFamily: 'GESSMED'),
                                )),
                                Divider(height: 5),
                                ListTile(
                                    title: Text(
                                  'More',
                                  style: TextStyle(fontFamily: 'GESSMED'),
                                )),
                                Divider(height: 5),
                                ListTile(
                                    title: Text(
                                  'Contact Us',
                                  style: TextStyle(fontFamily: 'GESSMED'),
                                )),
                                Divider(height: 5),
                                ListTile(
                                    title: Text(
                                  'Rate Our App',
                                  style: TextStyle(fontFamily: 'GESSMED'),
                                )),
                                Divider(height: 5),
                                ListTile(
                                    title: Text(
                                  'About Us',
                                  style: TextStyle(fontFamily: 'GESSMED'),
                                )),
                                Divider(height: 5),
                                ListTile(
                                    title: Text(
                                  'My Card',
                                  style: TextStyle(fontFamily: 'GESSMED'),
                                )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                    title: Text(
                                  'تغيير للغة العربية',
                                  style: TextStyle(fontFamily: 'GESSMED'),
                                )),
                                Divider(height: 5),
                                ListTile(
                                    title: Text(
                                  'Country',
                                  style: TextStyle(fontFamily: 'GESSMED'),
                                )),
                                Divider(height: 5),
                                ListTile(
                                    title: Text(
                                  'Notification Settings',
                                  style: TextStyle(fontFamily: 'GESSMED'),
                                )),
                              ],
                            )),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
