import 'package:alu_express/services/Models/order_model.dart';
import 'package:alu_express/services/Models/services.dart';
import 'package:alu_express/services/temp_res/order_data.dart';
import 'package:alu_express/ui_screens/shared_widgets/orders_image_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PendingOrders extends StatefulWidget {
  final userid;
  PendingOrders({Key key, this.userid}) : super(key: key);
  @override
  _PendingOrdersState createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (BuildContext context) =>
          firebaseServices.getpendingorderList(widget.userid),
      child: Pending(),
    );
  }
}

class Pending extends StatefulWidget {
  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  Widget build(BuildContext context) {
    List pendingorders = Provider.of<List<OrderModel>>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: pendingorders.length,
      itemBuilder: (context, index) {
        Stream<DocumentSnapshot> courseDocStream = FirebaseFirestore.instance
            .collection('orders')
            .doc(pendingorders[index].foodID)
            .snapshots();
        return StreamBuilder<DocumentSnapshot>(
          stream: courseDocStream,
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // get course document
              var foodDocument = snapshot.data.data;

              // get sections from the document
              var images = foodDocument()["ImageURL"];

              // build list using names from sections
              return ImageCard(
                image: images,
                ordernumber: "1",
                time: pendingorders[index]['orderTime'],
                orderid: orders[index]["customerID"],
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
