import 'package:alu_express_student/services/Models/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices{

    FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

      Stream<List<FoodModel>> getFoodList(vendorid) {
    print("printing vendr id");
    print(vendorid);
    return _fireStoreDataBase
        .collection('Foods')
        .where("IsFeatured", isEqualTo: 'true')
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => FoodModel.fromJson(document.data()))
            .toList());
  }


}