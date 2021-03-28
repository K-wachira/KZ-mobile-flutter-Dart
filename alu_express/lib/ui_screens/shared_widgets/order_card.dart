import 'package:alu_express/ui_screens/shared_widgets/menu_item.dart';
import 'package:flutter/material.dart';

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
      this.ingredients})
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
                    builder: (context) => UserProfile(
                          image: widget.image,
                          name: widget.name,
                          price: widget.price,
                          category: widget.category,
                          description: widget.description,
                          discount: widget.discount,
                          isFeaured: widget.isFeaured,
                          size: widget.size,
                          ingredients: widget.ingredients,
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
          ),
          subtitle: Text(widget.price),
          trailing: Icon(Icons.arrow_forward),
          isThreeLine: false,
        ),
      ),
    );
  }
}
