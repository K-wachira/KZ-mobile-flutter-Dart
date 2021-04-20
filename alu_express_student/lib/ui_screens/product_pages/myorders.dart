import 'package:alu_express_student/ui_screens/cart_pages/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser.uid;
  Future getOrders(uid) async {
    Stream<QuerySnapshot> snap =
        await firebaseFirestore.collection("orders").snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("My Orders"),
              SizedBox(
                width: 20,
              ),
            ],
          )),
        ),
        body: StreamBuilder(
            stream: firebaseFirestore
                .collection('orders')
                .where("customerID", isEqualTo: uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No recent orders"),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot order = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5),
                      child: Card(
                          color: Colors.grey[100],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 16.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("x" + order["quantity"]),
                                  Text(order["foodName"]),
                                  // Text("x" +
                                  //     snapshot.data().docs[index]["quantity"]),
                                ]),
                          )),
                    );
                  },
                );
              }
            }));
  }
}
