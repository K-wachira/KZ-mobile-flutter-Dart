import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

Future<void> saveMenu() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}

class SideProduct {
  String name;
  String price;
  SideProduct({@required this.name, @required this.price});
}

Future<void> saveCategory(data) async {
  FirebaseFirestore.instance.collection("categories").add(data).catchError((e) {
    print(e);
  });
}

Future<void> saveProduct(data) async {}
