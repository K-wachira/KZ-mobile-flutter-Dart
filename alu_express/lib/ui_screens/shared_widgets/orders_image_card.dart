import 'package:alu_express/services/Models/services.dart';
import 'package:alu_express/services/temp_res/order_data.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  final Map products;

  const ImageCard({
    Key key,
    @required this.products,
  }) : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _bottomSheet(products: widget.products);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.99,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.16,
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: Image.network(
                    widget.products["image"],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.033,
                ),
                Text(
                  widget.products["ordernumber"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "PTSans"),
                ),
                Text(
                  " widget.products[time]",
                  style: TextStyle(color: Colors.grey),
                ),
                ElevatedButton(
                    onPressed: () {
                      _bottomSheet(products: widget.products);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      onPrimary: Colors.black, // foreground
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'View',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "PTSans"),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }


  void _bottomSheet({
    Map products,
  }) {
    String secondstime = widget.products["time"].substring(18, 28);
    print(widget.products["time"]);
    print(secondstime);
    print(DateTime.fromMicrosecondsSinceEpoch((int.parse(secondstime)) * 1000000));
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.22,
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Image.network(
                              products["image"],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Order #23",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "PTSans"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: servings.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            servings[index]["quantity"].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "PTSans"),
                          ),
                          title: Text(
                            '${servings[index]["title"]}: (${servings[index]["type"]})',
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "PTSans"),
                          ),
                          subtitle: Text(
                            servings[index]["sides"],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: "PTSans"),
                          ),
                          trailing: Text(
                            "Kelvin",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "PTSans"),
                          ),
                          selected: true,
                          isThreeLine: true,
                        );
                      },
                    ),
                  ),

                  if (products['state'] == "Pending")...{
       InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            firebaseServices.updateField(products["orderid"],
                                "Accepted", "orderStatus", "orders");
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange,
                            onPrimary: Colors.black, // foreground
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Accept',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "PTSans"),
                          )),
                      ElevatedButton(
                          onPressed: () {
                              firebaseServices.updateField(products["orderid"],
                                "Completed", "orderStatus", "orders");
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrangeAccent[700],
                            onPrimary: Colors.black, // foreground
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Decline',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "PTSans"),
                          ))
                    ],
                  ))
                  }else if (products['state'] == "Accepted")...{
                             InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            firebaseServices.updateField(products["orderid"],
                                "Completed", "orderStatus", "orders");
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange,
                            onPrimary: Colors.black, // foreground
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Complete Order',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "PTSans"),
                          )),
              
                    ],
                  ))
                  } else if (products['state'] == "Completed")...{


                  }
         
                ]),
          );
        });
  }
}
