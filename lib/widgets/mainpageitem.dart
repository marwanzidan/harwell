import 'package:flutter/material.dart';
import 'package:harwel1/itemprop.dart';
import 'package:harwel1/props.dart';
bool clicked=true;
buttonclick(){
  return clicked;
}


class MainPageItem extends StatefulWidget {
  
  final String image, name, shortDescription, price;
   bool cancButton = false;
  var handler;
  MainPageItem({this.name, this.image, this.price, this.shortDescription,this.handler,this.cancButton = false});
  @override
  _MainPageItemState createState() => _MainPageItemState();
}

class _MainPageItemState extends State<MainPageItem> {
  
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => Props()
                      ),
                      );
           

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
              border: Border.all(
                color: Colors.white
              ),
               boxShadow: [
      BoxShadow(
        color: Color(0xFF979595).withOpacity(0.2),
        spreadRadius: 0.1,
        blurRadius: 6,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
            ),
            
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 widget.cancButton ? Align(alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          clicked = false;
                          buttonclick();
                         
                        });
                        
                      },
                      
                      child: Icon(Icons.cancel,color: Colors.black,))) : SizedBox(),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topRight,
                                          child: Image(
                        image: AssetImage(widget.image),
                      ),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 180),
                            child: Divider(
                              color: Color(0xFF707070),
                              thickness: 1,
                              

                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              widget.shortDescription,
                              style: TextStyle(
                                  color: Color(0xFF6B6363),
                                  fontSize: 10,
                                  fontFamily: 'GESSLIGHT'),
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
                          text: ' EG',
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
