import 'package:alu_express/services/Models/order_model.dart';
import 'package:alu_express/services/Models/user_model.dart';
import 'package:alu_express/services/Models/vendor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseServices extends ChangeNotifier {
  FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

  Stream<List<VendorModel>> getFoodList(vendorid) {
    //takes in vendorid and returns all the food that the vendor has on the db
    return _fireStoreDataBase
        .collection('Foods')
        .where("Vendor", isEqualTo: vendorid)
        .orderBy("Timedate")
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => VendorModel.fromJson(document.data()))
            .toList());
  }

  Stream<List<OrderModel>> getpendingorderList(vendorid) {
    // pending orders
    return _fireStoreDataBase
        .collection('orders/$vendorid')
        .where("orderStatus", isEqualTo: "Pending")
        .orderBy("orderTime")
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => OrderModel.fromJson(document.data()))
            .toList());
  }
  Stream<List<OrderModel>> getAcceptedorderList(vendorid) {
    // Accepted orders
    return _fireStoreDataBase
        .collection('orders/$vendorid')
        .where("orderStatus", isEqualTo: "Accepted")
        .orderBy("orderTime")
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => OrderModel.fromJson(document.data()))
            .toList());
  }

 Stream<List<OrderModel>> getAcceptedCompletedList(vendorid) {
    // Completed orders
    return _fireStoreDataBase
        .collection('orders/$vendorid')
        .where("orderStatus", isEqualTo: "Completed")
        .orderBy("orderTime")
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => OrderModel.fromJson(document.data()))
            .toList());
  }

  Future<Map> getitem(id) async {
    Null;
  }

  Future<String> updateField(docID, value, field) async {
    await FirebaseFirestore.instance
        .collection('Foods')
        .doc(docID)
        .update({field: value}).catchError((onError) {
      return onError;
    });
    return "true";
  }

  Stream<List<UserModel>> getuser(useid) {
    print(useid);
    return _fireStoreDataBase
        .collection('vendors')
        .where("vendorID", isEqualTo: useid)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => UserModel.fromJson(document.data()))
            .toList());
  }

  Future<String> addFood(data) async {
    DocumentReference ref = await FirebaseFirestore.instance
        .collection("Foods")
        .add(data)
        .catchError((e) {
      print(e);
      // ignore: return_of_invalid_type_from_catch_error
      return e;
    });
    //DocumentReference(Foods/w09DC3zZtjCdMNtQ6e4Z)
    String docid = ref.id.toString();
    print(docid);
    await FirebaseFirestore.instance
        .collection('Foods')
        .doc(docid)
        .update({'DocumentId': docid});
    return "true";
  }

//loggout user
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
