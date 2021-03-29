import 'package:alu_express/services/Models/vendor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {

  FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

  Stream<List<VendorModel>> getFoodList(vendorid) {
    print("printing vendr id");
    print(vendorid);
    return _fireStoreDataBase
        .collection('Foods')
        .where("Vendor", isEqualTo: vendorid)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => VendorModel.fromJson(document.data()))
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
    return "true";
  }

//loggout user
  Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
}
