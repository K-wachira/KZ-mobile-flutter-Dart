import 'package:alu_express_student/services/Models/firebase_services.dart';
import 'package:alu_express_student/services/Models/food_model.dart';
import 'package:alu_express_student/services/Models/cartcode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alu_express_student/ui_screens/shared_widgets/size_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:alu_express_student/services/Models/cart_funtionality.dart';

class HomeProducts extends StatefulWidget {
  final userid;
  const HomeProducts({Key key, this.userid}) : super(key: key);
  @override
  _HomeProductsState createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  int _quantity = 1;
  List cartItems = [];
  final dateTime = DateTime.now();
  final List cart = [];
  int total = 0;
  final CartFunctionality cartFunctionality = CartFunctionality();

  Widget build(BuildContext context) {
    void showProductDetails(Map productDetails) {
      int price = int.parse(productDetails["Price"]);
      total = price;
      void _incrementOrder() {
        setState(() {
          _quantity++;
          total = price * _quantity;
          print(total);
        });
      }

      void _decrementOrder() {
        setState(() {
          if (_quantity > 1) {
            _quantity--;
            total = price * _quantity;
            print(total);
          }
        });
      }

      void createitem(cart, totals, quantity, product) {
        setState(() {
          totals = totals * quantity;
        });
        Map item = {
          "FoodName": product["Name"],
          "Quantity": quantity.toString(),
          "Total": totals.toString(),
          "Vendor": product["Vendor"],
          "Customer": product["Userid"],
          "OrderTime": dateTime,
          "FoodID": product["FoodID"],
          'Category': product['Category'],
          "OrderStatus": "Pending",
        };
        cart.add(item);
        cartFunctionality.addToCart(item);
        print(cart);
      }

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: productDetails["productName"],
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("Add to Cart"),
                  onPressed: () {
                    createitem(cart, total, _quantity, productDetails);
                    Navigator.of(context).pop();
                  },
                )
              ],
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    productDetails["Name"],
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3),
                  ),
                  Text(
                    productDetails["Description"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        letterSpacing: .3),
                  ),
                  Image(
                    image: NetworkImage(productDetails["Image"]),
                    height: displayHeight(context) * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        (total * _quantity).toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .3),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            icon: Icon(Feather.minus),
                            onPressed: () {
                              setState(() {
                                _decrementOrder();
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            '$_quantity',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: .3),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _incrementOrder();
                            });
                          },
                          icon: Icon(Feather.plus),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    }

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              icon: Icon(Feather.shopping_cart),
              onPressed: () {
                showCart(context, cart);
              },
            ),
          ),
        ],
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
                  child: ViewUserPage(showProductDetails),
                ),
              )
            ],
          )),
    );
  }
}

class ViewUserPage extends StatelessWidget {
  ViewUserPage(this.showDialog);
  final Function showDialog;
  @override
  Widget build(BuildContext context) {
    List userList = Provider.of<List<FoodModel>>(context);

    return userList == null
        ? Padding(
            padding: const EdgeInsets.all(100.0),
            child: CircularProgressIndicator(),
          )
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
                  showDialog: showDialog,
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
                  foodid: userList[index].foodid,
                  timeuploaded: userList[index].timeuploaded,
                  quantity: userList[index].quantity,
                  indexs: index,
                ),
              );
            });
  }
}

class ProductCard extends StatefulWidget {
  final Function showDialog;
  final String image;
  final String name;
  final String price;
  final String category;
  final String description;
  final String discount;
  final String isFeaured;
  final String size;
  final String ingredients;
  final String vendor;
  final String foodid;
  final String timeuploaded;
  final String quantity;
  final int indexs;

  const ProductCard(
      {Key key,
      this.image,
      this.name,
      this.price,
      this.category,
      this.description,
      this.discount,
      this.isFeaured,
      this.size,
      this.ingredients,
      this.vendor,
      this.foodid,
      this.timeuploaded,
      this.quantity,
      this.indexs,
      this.showDialog})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return GestureDetector(
      onTap: () {
        Map productDetails = {
          "Image": widget.image,
          "Name": widget.name,
          "Price": widget.price,
          "Description": widget.description,
          "Ingredients": widget.ingredients,
          "Vendor": widget.vendor,
          "Userid": auth.currentUser.uid,
          "Category": widget.category,
          "Discount": widget.discount,
          "Size": widget.size,
          "FoodID": widget.foodid,
          "timeuploaded": widget.timeuploaded,
          'index': widget.indexs
        };
        widget.showDialog(productDetails);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 5)),
          Image(
            width: displayWidth(context) * 0.4,
            image: NetworkImage(widget.image),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30)),
            width: displayWidth(context) * 0.4,
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'RWF ' + widget.price,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                // Text(widget.description)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
