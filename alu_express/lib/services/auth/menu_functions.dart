import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class Product {
  // String productID;
  String productName;
  String price;
  String photoUrl;
  String categoryName;
  List types;
  List flavors;

  Product(
      {@required this.categoryName,
      @required this.price,
      this.flavors,
      this.types,
      this.photoUrl,
      // check on ID

      this.productName});
}

class Category {
  List products;
  String categoryName;

  Category({@required this.categoryName, @required this.products});
}

class Menu {
  String vendorID;
  List<Product> products;
  List<Category> categories;

  Menu(
      {@required this.vendorID,
      @required this.products,
      @required this.categories});
}

Future<void> saveMenu() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}

class SideProduct {
  String name;
  String price;
  SideProduct({@required this.name, @required this.price});
}

Future<void> addMenuData(postData) async {
  FirebaseFirestore.instance.collection("menus").add(postData).catchError((e) {
    print(e);
  });
}
