import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String category;
  final String description;
  final String discount;
  final String isFeaured;
  final String size;
  final String ingredients;

  const UserProfile(
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
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 1,
        ),
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.lightBlueAccent,
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                    child: Text("Vendor Name", style: TextStyle(fontSize: 20))),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Product information"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Name"),
                        leading: Icon(Icons.food_bank),
                        subtitle: Text(widget.name),
                      ),
                      ListTile(
                        title: Text("Price"),
                        leading: Icon(Icons.money),
                        subtitle: Text(widget.price),
                      ),
                      ListTile(
                        title: Text("discount"),
                        subtitle: Text(widget.discount),
                        leading: Icon(Icons.money_off),
                      ),
                      ListTile(
                        title: Text("size"),
                        subtitle: Text(widget.size),
                        leading: Icon(Icons.zoom_in),
                      ),
                      ListTile(
                        title: Text("category"),
                        subtitle: Text(widget.category),
                        leading: Icon(Icons.category),
                      ),
                      ListTile(
                        title: Text("description"),
                        subtitle: Text(widget.description),
                        leading: Icon(Icons.description),
                      ),
                      ListTile(
                        title: Text("ingredients"),
                        subtitle: Text(widget.ingredients),
                        leading: Icon(Icons.line_style_outlined),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ])));
  }
}
