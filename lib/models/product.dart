import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_bar/models/item_additional.dart';

class Product extends ChangeNotifier {
  Product.fromDocument(DocumentSnapshot document)
  {
    id = document.id;
    name = document['name'] as String;
    description = document['description'] as String;
    price = document['price'] as num;
    stock = document['stock'] as int;
    images = List<String>.from(document['images'] as List<dynamic>);
  }


  String id;
  String name;
  String description;
  num price;
  int stock;
  List<String> images;
  List<Product> products;

  bool get hasStock => stock > 0;

  Product _selectedProd;
  Product get selectedProd => _selectedProd;

  set selectedProd(Product value){
    _selectedProd = value;
    notifyListeners();
  }

  Product findProd(String name){
    try{
      products.firstWhere((p) => p.name == name);
    } catch (e){
      return null;
    }
  }

}