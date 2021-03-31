import 'package:alu_express_student/services/Models/firebase_services.dart';
import 'package:alu_express_student/services/Models/food_model.dart';
import 'package:alu_express_student/ui_screens/product_pages/product_card.dart';
import 'package:alu_express_student/ui_screens/shared_widgets/size_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeProducts extends StatefulWidget {
  final userid;
  const HomeProducts({Key key, this.userid}) : super(key: key);
  @override
  _HomeProductsState createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red[700],
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home"),
            SizedBox(width: 20),
            Icon(Feather.home),
          ],
        )),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.03,
            right: displayWidth(context) * 0.03,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: displayWidth(context) * 0.7,
                  child: Text(
                    "Order your favourite meals below",
                    style: GoogleFonts.ptSans(
                        fontSize: 25,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3),
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Click on a product to view the full details",
                  style: GoogleFonts.ptSans(
                      fontSize: 18, color: Colors.black54, letterSpacing: .3),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              Container(
                height: displayHeight(context),
                child: StreamProvider(
                  create: (BuildContext context) =>
                      firebaseServices.getFoodList(),
                  child: ViewUserPage(),
                ),
              )
            ],
          )),
    );
  }
}

class ViewUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List userList = Provider.of<List<FoodModel>>(context);

    return userList == null
        ? CircularProgressIndicator()
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: userList.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                child: ProductCard(
                  image: userList[index].imageURL,
                  name: userList[index].foodName,
                  price: userList[index].price,
                  category: userList[index].category,
                  description: userList[index].description,
                  discount: userList[index].discount,
                  isFeaured: userList[index].isFeatured,
                  size: userList[index].size,
                  ingredients: userList[index].ingredients,
                  vendor: userList[index].vendor,
                ),
              );
            });
  }
}

// ListView.builder(
//             itemCount: userList.length,
//             itemBuilder: (_, int index) => Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: ProductCard(
//                   image: userList[index].imageURL,
//                   name: userList[index].foodName,
//                   price: userList[index].price,
//                   category: userList[index].category,
//                   description: userList[index].description,
//                   discount: userList[index].discount,
//                   isFeaured: userList[index].isFeatured,
//                   size: userList[index].size,
//                   ingredients: userList[index].ingredients,
//                   vendor: userList[index].vendor,
//                 )),
//           );

//  GridView.count(
//                 shrinkWrap: false,
//                 primary: false,
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.8,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20,
//                 children: [
//                   ProductCard(
//                       image: 'assets/bkg.jpg',
//                       name: 'Stir Fry Rice',
//                       price: 'RWF 2500',
//                       description:
//                           'Vegetable Rice with peas, green beans and a side of your choice'),
//                   ProductCard(
//                       image: 'assets/bkg.jpg',
//                       name: 'Stir Fry Rice',
//                       price: 'RWF 2500',
//                       description:
//                           'Vegetable Rice with peas, green beans and a side of your choice'),
//                   ProductCard(
//                       image: 'assets/bkg.jpg',
//                       name: 'Stir Fry Rice',
//                       price: 'RWF 2500',
//                       description:
//                           'Vegetable Rice with peas, green beans and a side of your choice'),
//                   ProductCard(
//                       image: 'assets/bkg.jpg',
//                       name: 'Stir Fry Rice',
//                       price: 'RWF 2500',
//                       description:
//                           'Vegetable Rice with peas, green beans and a side of your choice'),
//                 ],
//               ),
