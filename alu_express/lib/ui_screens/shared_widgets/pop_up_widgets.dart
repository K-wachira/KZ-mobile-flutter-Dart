import 'package:alu_express/ui_screens/homepage_ui/home_page.dart';
import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  String text;
  PopUp({
    @required this.text,
    Key key,
  }) : super(key: key);
  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(''),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.text),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(userid: "123")));
          },
          textColor: Theme.of(context).primaryColor,
          child: Text('Ok'),
        ),
      ],
    );
  }
}


// DocumentReference(products/25Nf9TPtbQMEgoy6CvE2)