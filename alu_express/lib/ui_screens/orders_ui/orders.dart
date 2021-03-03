import 'package:alu_express/ui_screens/orders_ui/accepted_item.dart';
import 'package:alu_express/ui_screens/orders_ui/completed.dart';
import 'package:alu_express/ui_screens/orders_ui/pending.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Pending",
                ),
                Tab(text: "Accepted"),
                Tab(text: "Completed"),
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
