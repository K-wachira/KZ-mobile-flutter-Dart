import 'package:alu_express/ui_screens/menu_pages/prev_build/addproducts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:alu_express/services/auth/menu_functions.dart';

class AddMenu extends StatelessWidget {
  final userID;
  AddMenu({@required this.userID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent[700],
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(true),
          child: Icon(
            Feather.chevron_left,
            color: Colors.white,
          ),
        ),
        title: Padding(
          // TODO: Make the padding responsive
          padding: const EdgeInsets.fromLTRB(90.0, 0, 0, 0),
          child: Text(
            "Create Menu",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "PTSans",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: AddMenuBody(userID),
    );
  }
}

class AddMenuBody extends StatefulWidget {
  final uid;
  AddMenuBody(this.uid);
  @override
  _AddMenuBodyState createState() => _AddMenuBodyState();
}

class _AddMenuBodyState extends State<AddMenuBody> {
  @override
  TextEditingController categoryController = TextEditingController();
  String category;
  void initState() {
    super.initState();
    categoryController.addListener(() {
      category = categoryController.text;
    });
  }

  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Center(
          child: TextFormField(
            controller: categoryController,
            decoration: new InputDecoration(
              labelText: "Enter Category",
              labelStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            validator: (val) {
              if (val.length == 0) {
                return "Category cannot be empty";
              } else {
                return null;
              }
            },
            style: new TextStyle(
              fontFamily: "PTSans",
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color(0xFFFFCC00),
          onPressed: () {
            category = categoryController.text;
            Map<String, String> data = {
              "vendorID": widget.uid,
              'categoryName': category,
            };
            saveCategory(data);
          },
          child: Text(
            "Save Category",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 100),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color(0xFFFFCC00),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddProductsPage(
                          uid: widget.uid,
                        )));
          },
          child: Text(
            "Add Products",
          ),
        ),
      ),
      SizedBox(
        width: 30.0,
      ),
    ]);
  }
}
