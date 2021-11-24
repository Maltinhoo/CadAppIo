import 'package:flutter/cupertino.dart';

class ItemAdditional{

  ItemAdditional.fromMap(Map<String, dynamic> map){
    item = map['item'] as String;
    price = map['price'] as num;
    stock = map['stock'] as int;
  }

  String item;
  num price;
  int stock;

  String get hasName => item;

  bool get hasStock => stock > 0;

  @override
  String toString() {
    return 'ItemAdditional{item: $item, price: $price, stock: $stock}';
  }
}