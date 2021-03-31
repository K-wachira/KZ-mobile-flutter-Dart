import 'package:alu_express_student/ui_screens/shared_widgets/size_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProductDetails extends StatefulWidget {
  final productName;
  ProductDetails({@required this.productName});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    int quantity = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Center(child: Text(widget.productName)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Burger",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Enjoy a delicious beef and cheese burger today",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        letterSpacing: .3),
                  )
                ],
              ),
            ),
            Image(
              image: AssetImage("assets/burgers.jpg"),
              height: displayHeight(context) * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "RWF 3000",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .3),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          quantity += 1;
                        });
                      },
                      icon: Icon(Feather.plus),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        quantity.toString(),
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
                        icon: Icon(Feather.minus),
                        onPressed: () {
                          setState(() {
                            quantity -= 1;
                          });
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                  onPressed: () {},
                  icon: Icon(Feather.shopping_cart),
                  label: Text("Add to cart")),
            )
          ],
        ),
      ),
    );
  }
}
