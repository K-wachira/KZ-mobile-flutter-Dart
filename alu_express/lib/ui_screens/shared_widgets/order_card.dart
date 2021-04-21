import 'package:alu_express/ui_screens/shared_widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCard extends StatefulWidget {
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
  final String documentId;

  const MenuCard(
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
      this.documentId})
      : super(key: key);

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProduct(
                          image: widget.image,
                          name: widget.name,
                          price: widget.price,
                          category: widget.category,
                          description: widget.description,
                          discount: widget.discount,
                          isFeaured: widget.isFeaured,
                          size: widget.size,
                          ingredients: widget.ingredients,
                          vendor: widget.vendor,
                          documentId: widget.documentId,
                        )));
          },
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          leading: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              widget.image,
            ),
          ),
          title: Text(
            widget.name,
            style: GoogleFonts.ptSans(fontSize: 18, letterSpacing: .3),
          ),
          subtitle: Text(
            "RWF " + widget.price,
            style: GoogleFonts.ptSans(
                color: Colors.red[900], fontSize: 14, letterSpacing: .3),
          ),
          trailing: Icon(
            Icons.chevron_right_rounded,
            color: Colors.black,
            size: 30.0,
          ),
          isThreeLine: false,
        ),
      ),
    );
  }
}
