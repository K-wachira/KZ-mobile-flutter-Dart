import 'package:alu_express_student/services/Models/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class FirebaseServices extends ChangeNotifier {
  FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

  Stream<List<FoodModel>> getFoodList() {
    print("printing vendr id");
    return _fireStoreDataBase
        .collection('Foods')
        .where("IsFeatured", isEqualTo: 'true')
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => FoodModel.fromJson(document.data()))
            .toList());
  }
}
