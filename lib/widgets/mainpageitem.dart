import 'package:flutter/material.dart';

class MainPageItem extends StatefulWidget {
  final String image, name, shortDescription, price;
  var handler;
  MainPageItem({this.name, this.image, this.price, this.shortDescription,this.handler});
  @override
  _MainPageItemState createState() => _MainPageItemState();
}

class _MainPageItemState extends State<MainPageItem> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
           

        });
      },
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image(
                      image: AssetImage(widget.image),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                    color: Color(0xFF6B6363),
                                    fontSize: 15,
                                    fontFamily: 'GESSBOLD'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              widget.shortDescription,
                              style: TextStyle(
                                  color: Color(0xFF6B6363),
                                  fontSize: 11,
                                  fontFamily: 'GESSMEDIUM'),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                color: Color(0xFFFDBA52),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.price,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LATOREGULAR'),
                        ),
                        TextSpan(
                          text: ' SAR',
                          style: TextStyle(
                            fontFamily: 'LATOTHIN',
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}