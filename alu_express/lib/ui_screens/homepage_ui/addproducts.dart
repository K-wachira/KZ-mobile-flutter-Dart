import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:alu_express/services/auth/menu_functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:alu_express/ui_screens/homepage_ui/addsides.dart';

TextStyle kFont = TextStyle(
    fontFamily: "PTSans", color: Colors.black, fontWeight: FontWeight.w500);

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({Key key, @required this.uid}) : super(key: key);
  final String uid;
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
      body: MenuBody(
        userId: uid,
      ),
    );
  }
}

class MenuBody extends StatefulWidget {
  const MenuBody({
    @required this.userId,
    Key key,
  }) : super(key: key);
  final userId;
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
  String tempcategory;
  String catid;
  String productphotoUrl;
  DocumentReference productReference;
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
                      StreamBuilder(
                          stream: firebaseFirestore
                              .collection('categories')
                              .where("vendorID", isEqualTo: widget.userId)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text("Loading");
                            } else {
                              List<DropdownMenuItem> myCategories = [];
                              for (int i = 0;
                                  i < snapshot.data.docs.length;
                                  i++) {
                                DocumentSnapshot docSnapshot =
                                    snapshot.data.docs[i];
                                myCategories.add(DropdownMenuItem(
                                  child:
                                      Text(docSnapshot.data()['categoryName']),
                                  value: docSnapshot.id,
                                ));
                              }

                              return DropdownButton(
                                hint: Text("Choose category"),
                                items: myCategories,
                                onChanged: (cate) {
                                  setState(() {
                                    catid = cate;
                                    tempcategory = cate;
                                    print(catid);
                                  });
                                },
                                value: tempcategory,
                              );
                            }
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
                          controller: price,
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
                            Map postData = {
                              'categoryID': catid,
                              'photoUrl': imageUrl,
                              'price': productPrice,
                              'productName': productName,
                              'dealOfTheDay': false,
                              'promoted': false
                            };
                            productReference = saveProduct(postData);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddSidesPage(
                                    prodId: productReference,
                                  ),
                                ));
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
