import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My Cart"),
            SizedBox(
              width: 20,
            ),
            Icon(Feather.shopping_cart),
          ],
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            OrderCard(),
            OrderCard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey[100],
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Total:",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Colors.red[700])),
                      SizedBox(
                        width: 20,
                      ),
                      Text("RWF 3000",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Cancel"),
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Place Order"),
                    style: ElevatedButton.styleFrom(primary: Colors.red[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[100],
        elevation: 5,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image(
                    width: 70,
                    image: AssetImage(
                      "assets/sandwich.jpg",
                    )),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chicken Sandwich x2",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Vendor: Avo Foods"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Cutomer: Jane Doe"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Rwf 3000", style: TextStyle(color: Colors.red[700])),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(icon: Icon(Feather.x), onPressed: () {})
              ],
            )),
      ),
    );
  }
}
