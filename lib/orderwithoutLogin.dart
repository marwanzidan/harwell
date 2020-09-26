import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class OrderWithoutLogin extends StatefulWidget {
  @override
  _OrderWithoutLoginState createState() => _OrderWithoutLoginState();
}

TextEditingController name = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController address = TextEditingController();

class _OrderWithoutLoginState extends State<OrderWithoutLogin> {
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

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  bool cashonDelivery = true;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'بيانات التوصيل',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'GESSMED'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    controller: name,
                    validator: (String value) {
                      return null;
                    },
                    style: textStyle,
                    decoration: getInputDecoration("name".tr().toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    controller: phone,
                    validator: (String value) {
                      return null;
                    },
                    style: textStyle,
                    decoration: getInputDecoration("phone".tr().toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    maxLines: 5,
                    controller: address,
                    validator: (String value) {
                      return null;
                    },
                    style: textStyle,
                    decoration: InputDecoration(
                      hintText: "address".tr().toString(),
                      hintStyle: TextStyle(
                          fontFamily: 'GESSLIGHT',
                          fontSize: 15,
                          color: Color(0xFFA8A8A8)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA8A8A8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA8A8A8)),
                      ),
                    ),
                  ),
                ),
                CheckboxListTile(
                  value: cashonDelivery,
                  onChanged: (value) {
                    setState(() {
                      cashonDelivery = !cashonDelivery;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('cashOnDelivery'.tr().toString()),
                ),
                CheckboxListTile(
                  value: !cashonDelivery,
                  onChanged: (value) {
                    setState(() {
                      cashonDelivery = !cashonDelivery;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('creditCard'.tr().toString()),
                ),
                cashonDelivery
                    ? Container()
                    : CreditCardWidget(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        showBackView: isCvvFocused,
                      ),
                cashonDelivery
                    ? Container()
                    : CreditCardForm(
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFF6BF0B),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Text(
                        'continue'.tr().toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
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
