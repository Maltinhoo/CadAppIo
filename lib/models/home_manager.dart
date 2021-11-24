import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_bar/models/section.dart';

class HomeManager extends ChangeNotifier{

  HomeManager(){
    _loadSections();
  }

  List<Section> sections = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _loadSections() async{
    firestore.collection('home').snapshots().listen((snapshot) {
      sections.clear();
      for(final DocumentSnapshot document in snapshot.docs){
        sections.add(Section.fromDocument(document));
      }
      notifyListeners();
    });
  }
}