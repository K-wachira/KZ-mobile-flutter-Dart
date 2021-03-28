import 'package:alu_express/services/back_end/vendor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  String userid;

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
      return e;
    });
    return "true";
  }
}
