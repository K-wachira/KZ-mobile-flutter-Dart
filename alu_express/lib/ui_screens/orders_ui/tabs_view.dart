import 'package:alu_express/ui_screens/orders_ui/accepted_item.dart';
import 'package:alu_express/ui_screens/orders_ui/completed.dart';
import 'package:alu_express/ui_screens/orders_ui/pending.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Pending(),
              AcceptedItem(),
              Completed(),


            ],
          ),
        ),
      ),
    );
  }
}