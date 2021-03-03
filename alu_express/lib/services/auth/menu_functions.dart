import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String productID;
  String productName;
  String price;
  String photoUrl;
  String categoryID;
  List types;
  List flavors;

  Product(
      {@required this.categoryID,
      @required this.price,
      this.flavors,
      this.types,
      this.photoUrl,
      // check on ID
      @required this.productID,
      this.productName});
}

class Category {
  String categoryID;
  String categoryName;

  Category({@required this.categoryID, @required this.categoryName});
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
