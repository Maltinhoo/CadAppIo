import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_bar/models/item_additional.dart';
import 'package:food_bar/models/product.dart';

class CartProduct extends ChangeNotifier{
  CartProduct.fromProduct(this.product){
    productId = product.id;
    quantity = 1;
    prod = product.name;
  }

  CartProduct.fromDocument(DocumentSnapshot document){
    id = document.id;
    productId = document['pid'] as String;
    quantity = document['quantity'] as int;
    prod = document['prod'] as String;

    firestore.doc('products/$productId').get().then(
            (doc) {
              product = Product.fromDocument(doc);
              notifyListeners();
            }
    );
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String id;

  Product product;

  String prod;
  String productId;
  int quantity;

  Product get name {
    if(product == null) return null;
    return product.findProd(prod);
  }

  num get totalPrice => product.price * quantity;

  Map<String, dynamic> toCartItemMap(){
    return{
      'pid' : productId,
      'quantity' : quantity,
      'prod' : prod,
    };
  }

  bool stackable(Product product){
    return product.id == productId && product.name == prod;
  }

  void increment(){
    quantity++;
    notifyListeners();
  }

  void decrement(){
    quantity--;
    notifyListeners();
  }

  bool get hasStock{
    final prod = product;
    if(product == null) return false;
    return prod.stock >= quantity;
  }

}