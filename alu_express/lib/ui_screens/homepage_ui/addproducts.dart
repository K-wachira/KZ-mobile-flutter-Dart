import 'package:alu_express/ui_screens/homepage_ui/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:alu_express/services/auth/menu_functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

TextStyle kFont = TextStyle(
    fontFamily: "PTSans", color: Colors.black, fontWeight: FontWeight.w500);

class AddProductsPage extends StatelessWidget {
  final uid;

  const AddProductsPage({Key key, this.uid}) : super(key: key);

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
      body: MenuBody(uid: uid),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class MenuBody extends StatefulWidget {
  final uid;
  const MenuBody({
    @required this.uid,
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
  String dropdownValue = 'Side';

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
      });
    }

    Future getUrl() {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('products/' + productName + '.jpg');
      firebase_storage.UploadTask task = ref.putFile(image);
      task.whenComplete(() => setState(() {
            imageUrl = ref.getDownloadURL().toString();
            print(imageUrl);
          }));
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
                            labelText: "Choose Category for Product")),
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
                              width: 10,
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
                    Container(
                        height: 100,
                        width: 100,
                        child: (image != null) ? Image.file(image) : Text("")),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Feather.chevron_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Side',
                          'Flavor',
                          'Filling',
                          'Size',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
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
                                    labelText: "Side Product Name")),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: extraCost,
                              decoration: InputDecoration(
                                  labelStyle: kFont.copyWith(fontSize: 14),
                                  labelText: "Extra Product Cost"),
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
                          setState(() {});
                        },
                        child: Text(
                          "Save Item",
                          style: kFont,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Color(0xFFFFCC00),
                        onPressed: () {
                          Map<String, String> postData = {
                            "vendorID": widget.uid,
                            "categories": categories.toString()
                          };
                        },
                        child: Text(
                          "Next",
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
