import 'package:alu_express_student/ui_screens/product_pages/products_details.dart';
import 'package:alu_express_student/ui_screens/shared_widgets/size_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
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
      this.vendor})
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
          "image": widget.image,
          "name": widget.name,
          "price": widget.price,
          "description": widget.description,
          "ingredients": widget.ingredients,
          "vendor": widget.vendor,
          "userid": auth.currentUser.uid,
        };
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetails(productDetails: productDetails)));
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
                borderRadius: BorderRadius.circular(10)),
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
