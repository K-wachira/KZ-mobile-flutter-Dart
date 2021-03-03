import 'package:alu_express/ui_screens/homepage_ui/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:alu_express/services/auth/menu_functions.dart';

class NewMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(true),
          child: Icon(
            Feather.chevron_left,
            color: Colors.black,
          ),
        ),
        title: Padding(
          // TODO: Make the padding responsive
          padding: const EdgeInsets.fromLTRB(90.0, 0, 0, 0),
          child: Text(
            "Create Menu",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "PTSans",
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Text(
              "AXpress",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Satisfy",
              ),
            ),
          ),
        ],
      ),
      body: MenuBody(),
    );
  }
}

class MenuBody extends StatefulWidget {
  const MenuBody({
    Key key,
  }) : super(key: key);

  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  List products;
  List categories;
  String productID;
  String vendorID; // Fetch from login
  String productName;
  String price;
  String photoUrl;
  String categoryID;
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
        color: Colors.white,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Meze Fresh",
                style: TextStyle(
                    color: Color(0xFFDC2F02),
                    fontFamily: "PTSans",
                    fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView(
                  children: [
                    TextFormField(
                        //TODO: Fix this
                        // validator: (String input) => {
                        //       if (input.isNotEmpty)
                        //         {
                        //           setState(() {
                        //             input = categoryID;
                        //           }),
                        //         },
                        //     },
                        decoration: InputDecoration(
                            labelText:
                                "Category Name e.g. Breakfast, Drinks, Lunch")),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Item Name e.g. Fries, Soda"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Item Type e.g. Spicy, 500ml")),
                        ),
                        IconButton(
                          iconSize: 16,
                          icon: Icon(Feather.plus),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Flavors/Sides")),
                        ),
                        IconButton(
                          iconSize: 16,
                          icon: Icon(Feather.plus),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color(0xFFFFCC00),
                          onPressed: () {},
                          child: Text("New Item"),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color(0xFFFFCC00),
                          onPressed: () {},
                          child: Text("New Category"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 10.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Color(0xFFDC2F02),
                        onPressed: () {},
                        child: Text("Save"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class FormField extends StatelessWidget {
  const FormField({
    @required this.title,
    Key key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        border: new OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        fillColor: Colors.white,
        labelStyle:
            TextStyle(color: Colors.black, fontSize: 14, fontFamily: "PTSans"),
        labelText: title,
      )),
    );
  }
}
