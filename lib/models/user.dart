import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Usuario{

  Usuario({this.name, this.email, this.password, this.id});


  Usuario.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document['name'] as String;
    email = document['email'] as String;
    phone = document['phone'] as String;
  }

  String id;
  String name;
  String email;
  String phone;
  String password;
  String confirmPassword;

  DocumentReference get firestoreRef =>
  FirebaseFirestore.instance.doc('users/$id');

  CollectionReference get cartReference =>
  firestoreRef.collection('cart');

  Future<void> saveData() async{
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}