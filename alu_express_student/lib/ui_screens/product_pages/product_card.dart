import 'package:alu_express_student/ui_screens/shared_widgets/size_helpers.dart';
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
    return InkWell(
      onTap: () {},
      child: Container(
        height: displayHeight(context) * 0.5,
        width: displayWidth(context) * 0.5,
        decoration: BoxDecoration(
          color: Colors.red[900].withOpacity(.06),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 5)),
            CircleAvatar(
              radius: displayWidth(context) * 0.15,
              backgroundImage: NetworkImage(widget.image),
            ),
            ListTile(
              leading: Text(
                widget.name,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              trailing: Text(
                widget.price,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: displayWidth(context) * 0.4,
              child: Text(widget.description),
            )
          ],
        ),
      ),
    );
  }
}
