import 'package:alu_express/services/temp_res/order_data.dart';
import 'package:alu_express/ui_screens/shared_widgets/orders_image_card.dart';
import 'package:flutter/material.dart';

class Completed extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return ImageCard(
          image: orders[index]["imageUrl"],
          ordernumber: orders[index]['OrderNumber'],
          time: orders[index]['Time'],
          orderid: orders[index]["OrderID"],
        );
      },
    );
  }
}
