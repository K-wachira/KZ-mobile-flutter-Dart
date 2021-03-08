import 'package:alu_express/ui_screens/homepage_ui/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:alu_express/services/auth/menu_functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

TextStyle kFont = TextStyle(
    fontFamily: "PTSans", color: Colors.black, fontWeight: FontWeight.w500);

class NewMenu extends StatelessWidget {
  final uid;
  NewMenu({@required this.uid});
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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        //     child: Text(
        //       "AXpress",
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontFamily: "Satisfy",
        //       ),
        //     ),
        //   ),
        // ],
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
  String imageUrl;
  List products = [];
  List categories = [];
  List choices = [];
  List sides = [];
  // String vendorID;
  File image; // Fetch from login
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController side = TextEditingController();
  TextEditingController extraCost = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  String productName;
  String productPrice;
  String productType;
  String productSide;
  String proudctExtraCost;
  String productphotoUrl;
  String productCategoryName;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    name.addListener(() {
      productName = name.text;
    });
    price.addListener(() {
      productPrice = price.text;
    });
    type.addListener(() {
      productType = type.text;
    });
    side.addListener(() {
      productSide = side.text;
    });
    extraCost.addListener(() {
      proudctExtraCost = extraCost.text;
    });
    categoryName.addListener(() {
      productCategoryName = categoryName.text;
    });
  }

  Widget build(BuildContext context) {
    Future getImage() async {
      final ImagePicker imagePicker = ImagePicker();
      PickedFile img = await imagePicker.getImage(
          source: ImageSource.gallery, imageQuality: 50);
      setState(() {
        image = File(img.path);
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('products/' + productName + '.jpg');

        firebase_storage.UploadTask task = ref.putFile(image);
        task.whenComplete(() => imageUrl = ref.getDownloadURL().toString());
      });
    }

    return Container(
        height: 500,
        width: 500,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                        controller: categoryName,

                        // validator: (String input) => {
                        //       input.isEmpty ? 'Category Name Required' : null,
                        //     },
                        decoration: InputDecoration(
                            labelStyle: kFont.copyWith(fontSize: 14),
                            labelText:
                                "Category Name e.g. Breakfast, Drinks, Lunch")),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            labelStyle: kFont.copyWith(fontSize: 14),
                            labelText: "Product Name e.g. Fries, Soda"),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Upload Photo",
                                style: kFont,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: IconButton(
                                icon: Icon(Feather.upload),
                                onPressed: () {
                                  getImage();
                                },
                              ),
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: TextFormField(
                              controller: type,
                              decoration: InputDecoration(
                                  labelStyle: kFont.copyWith(fontSize: 14),
                                  labelText: "Sizes e.g. 500ml")),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: price,
                              decoration: InputDecoration(
                                  labelStyle: kFont.copyWith(fontSize: 14),
                                  labelText: "Price"),
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 16,
                          icon: Icon(Feather.plus),
                          onPressed: () {
                            setState(() {
                              choices.add(SideProduct(
                                  name: type.text, price: price.text));
                              type.clear();
                              price.clear();
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                                controller: side,
                                decoration: InputDecoration(
                                    labelStyle: kFont.copyWith(fontSize: 14),
                                    labelText: "Flavors/Sides")),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: extraCost,
                              decoration: InputDecoration(
                                  labelStyle: kFont.copyWith(fontSize: 14),
                                  labelText: "Extra cost"),
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 16,
                          icon: Icon(Feather.plus),
                          onPressed: () {
                            setState(() {
                              sides.add(SideProduct(
                                  name: side.text, price: extraCost.text));
                              side.clear();
                              price.clear();
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Color(0xFFFFCC00),
                        onPressed: () {
                          setState(() {
                            products.add((Product(
                                price: price.text,
                                types: choices,
                                flavors: sides)));

                            name.clear();
                            side.clear();
                            type.clear();
                            price.clear();
                            extraCost.clear();
                          });
                        },
                        child: Text(
                          "New Item",
                          style: kFont,
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Color(0xFFFFCC00),
                        onPressed: () {
                          setState(() {
                            categories.add(Category(
                                categoryName: categoryName.text,
                                products: products));
                            categoryName.clear();
                            name.clear();
                            side.clear();
                            type.clear();
                            price.clear();
                            extraCost.clear();
                          });
                        },
                        child: Text(
                          "New Category",
                          style: kFont,
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Color(0xFFFFCC00),
                        onPressed: () {
                          Map<String, String> postData = {
                            "vendorID": "001",
                            "categories": categories.toString()
                          };
                          addMenuData(postData);
                        },
                        child: Text(
                          "Save",
                          style: kFont,
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ))
          ],
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
