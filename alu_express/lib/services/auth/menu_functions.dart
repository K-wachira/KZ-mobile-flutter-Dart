import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveCategory(data) async {
  FirebaseFirestore.instance.collection("categories").add(data).catchError((e) {
    print(e);
  });
}

Future<void> saveProduct(data) async {
  FirebaseFirestore.instance.collection("products").add(data).catchError((e) {
    print(e);
  });
}

Future<void> saveSide(data) async {
  FirebaseFirestore.instance.collection("sides").add(data).catchError((e) {
    print(e);
  });
}
