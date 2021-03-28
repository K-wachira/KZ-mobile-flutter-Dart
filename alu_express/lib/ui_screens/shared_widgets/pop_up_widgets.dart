import 'package:alu_express/ui_screens/homepage_ui/home_page.dart';
import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  String text;
  bool successful;
  PopUp({
    @required this.text,
    this.successful,
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
        ElevatedButton(
          onPressed: () {
            widget.successful
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(userid: "123")))
                : Navigator.of(context).pop();
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}


// DocumentReference(products/25Nf9TPtbQMEgoy6CvE2)