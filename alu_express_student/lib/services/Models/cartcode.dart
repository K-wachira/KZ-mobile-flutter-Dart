import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
Future<void> saveCart(cart) async {
  for (int i = 0; i < cart.length; i++) {
    Map data = {
      "foodName": cart[i]["FoodName"],
      "quantity": cart[i]["Quantity"],
      "total": cart[i]["Total"],
      "vendorID": cart[i]["Vendor"],
      "customerID": cart[i]["Customer"],
      "orderTime": cart[i]["OrderTime"],
      "foodID": cart[i]["FoodID"],
      'category': cart[i]["Category"],
      "orderStatus": cart[i]["OrderStatus"]
    };
    print(data);
    Map<String, dynamic> myMap = new Map<String, dynamic>.from(data);
    await firebaseFirestore.collection("orders").add(myMap);
  }
}
