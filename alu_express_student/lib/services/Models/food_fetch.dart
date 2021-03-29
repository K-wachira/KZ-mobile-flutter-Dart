// import 'package:alu_express_student/services/Models/food_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';

// class FoodFetch extends ChangeNotifier {
//   List<FoodModel> foodModelList = [];
//   FoodModel foodModel;
//   Future<void> getFoodList() async {
//     List<FoodModel> newFoodModelList = [];
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection('Foods').get();
//     querySnapshot.docs.forEach((element) {
//       foodModel = FoodModel(
//           ImageURL: element.data()['ImageURL'],
//           FoodName: element.data()['FoodName'],
//           Price: element.data()['Price'],
//           Description: element.data()['Description']);
//     });

//     newFoodModelList.add(foodModel);
//     foodModelList = newFoodModelList;
//   }

//   get throwFoodModelList {
//     return foodModelList;
//   }
// }
