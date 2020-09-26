import 'package:flutter/material.dart';

import '../main.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';

void addToCart({
  String image,
  String arabic_title,
  String english_title,
  String id,
  String arabic_description,
  String english_description,
  String price,
  String category_id,
  String main_product_id,
}) {
  print('enter');
  cart.add({
    'imgUrl': image,
    'arabic_title': arabic_title,
    'english_title': english_title,
    'arabic_description': arabic_description,
    'english_description': english_description,
    'price': price,
    'category_id': category_id,
    'id': id,
    'main_product_id': main_product_id,
  });
  print('exit');
}

void removeFromCart({String removeOrder}) {
  for (var i = 0; i < cart.length; i++) {
    if (cart[i]['main_product_id'] == removeOrder) {
      cart.removeAt(i);
      break;
    }
  }
}
