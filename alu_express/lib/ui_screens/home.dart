import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String uid;

  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String title = "Home";

  final signedInMessage = Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 30.0)),
      Text(
        'Explore ALU App',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.amber,
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width * 0.65,
        child: Text(widget.uid),
      ),
    );
  }
}
