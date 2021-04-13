import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

void showCart(context, cart) {
  // List items = [];
  // for (int i = 0; i < cart.length; i++) {
  //   items.add(
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Text(cart[i]["FoodName"]),
  //         Text(cart[i]["Quantity"]),
  //         Text(cart[i]["OrderTime"].toString()),
  //       ],
  //     ),
  //   );
  // }
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text("My Cart"),
          actions: [
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Place Order"),
              onPressed: () {
                saveCart(cart);
                print("Order Placed");
                Navigator.of(context).pop();
              },
            )
          ],
          content: Container(
            height: 400,
            width: 300,
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (ctx, i) {
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(cart[i]["FoodName"]),
                    Text(cart[i]["Quantity"]),
                    Text(cart[i]["OrderTime"].toString()),
                  ],
                );
              },
            ),
          ),
        );
      });
}