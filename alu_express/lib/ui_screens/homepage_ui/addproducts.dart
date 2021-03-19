import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:alu_express/services/auth/menu_functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

TextStyle kFont = TextStyle(
    fontFamily: "PTSans", color: Colors.black, fontWeight: FontWeight.w500);

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({Key key}) : super(key: key);

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
            "Add Products",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "PTSans",
                fontWeight: FontWeight.bold),
          ),
        ),
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
  File image;
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  String productName;
  String productPrice;
  String category;
  String catid;
  String productphotoUrl;
  final _formKey = GlobalKey<FormState>();
  DocumentSnapshot snapshot;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void initState() {
    super.initState();
    name.addListener(() {
      productName = name.text;
    });
    price.addListener(() {
      productPrice = price.text;
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

    // void func() async {
    //   await FirebaseFirestore.instance
    //       .collection('categories')
    //       .where(FieldPath.documentId,
    //           isEqualTo: "FrtNmp6btdZpZELwjMHl6rEAnaI3")
    //       .get()
    //       .then((event) {
    //     if (event.docs.isNotEmpty) {
    //       Map<String, dynamic> Function() documentData =
    //           event.docs.single.data; //if it is a single document
    //       print(documentData);
    //     }
    //   }).catchError((e) => print("error fetching data: $e"));
    // }

    // Firestore.instance
    //     .collection(collectionName)
    //     .where("index", arrayContains: search)
    //     .where('allowed_roles', arrayContains: GlobalVars.userRole.toString())
    //     .orderBy('date', descending: true)
    //     .snapshots();

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
                    child: ListView(children: [
                      //TODO: Return dropdown of categories in firebase
                      // TODO: Get documentID of each category as the value of catid
                      StreamBuilder(
                          stream: firebaseFirestore
                              .collection('categories')
                              .where("vendorID" , isEqualTo: "FrtNmp6btdZpZELwjMHl6rEAnaI3")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text("");
                            }
                            return DropdownButton(
                              value: category,
                              // isDense: true,
                              onChanged: (valueSelectedByUser) {
                                setState(() {
                                  category = valueSelectedByUser;
                                });
                              },
                              hint: Text('Choose category of product'),
                              items: snapshot.data.documents
                                  .map((DocumentSnapshot document) {
                                return DropdownMenuItem<String>(
                                  value: document.data()['categoryName'],
                                  child: Text(document.data()['categoryName']),
                                );
                              }).toList(),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                              labelStyle: kFont.copyWith(fontSize: 14),
                              labelText: "Product Name"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                              labelStyle: kFont.copyWith(fontSize: 14),
                              labelText: "Price"),
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
                      SizedBox(height: 20),
                      Container(
                          height: 100,
                          width: 100,
                          child:
                              (image != null) ? Image.file(image) : Text("")),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Color(0xFFFFCC00),
                        onPressed: () {
                          setState(() {
                            Map<String, String> postData = {
                              'categoryID': catid,
                              'photoUrl': imageUrl,
                              'price': productPrice,
                              'productName': productName,
                            };
                            saveProduct(postData);
                            //TODO: Get productID on save
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => AddSidesPage(
                            //         prodId: productID,
                            //       ),
                            //     ));
                          });
                        },
                        child: Text(
                          "Next",
                          style: kFont,
                        ),
                      ),
                    ])),
              ),
            )
          ],
        ));
  }
}

// class FormField extends StatelessWidget {
//   const FormField({
//     @required this.title,
//     Key key,
//   }) : super(key: key);
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//       child: TextFormField(
//           decoration: InputDecoration(
//         border: new OutlineInputBorder(
//             borderSide: BorderSide(
//           color: Colors.black,
//         )),
//         fillColor: Colors.white,
//         labelStyle:
//             TextStyle(color: Colors.black, fontSize: 14, fontFamily: "PTSans"),
//         labelText: title,
//       )),
//     );
//   }
// }
