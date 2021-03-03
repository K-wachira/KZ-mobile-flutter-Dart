import 'package:alu_express/services/temp_res/order_data.dart';
import 'package:flutter/material.dart';

class AcceptedItem extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Image.network(
              "https://i.imgur.com/QNOKQQn.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ORDER #23",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18.0),
              ),
              Text(
                "10.20am",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    fontSize: 18.0),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: servings.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(servings[index]["quantity"].toString()),
                title: Text(
                  '${servings[index]["title"]}: (${servings[index]["type"]})',
                  textScaleFactor: 1.5,
                ),
                subtitle: Text(servings[index]["sides"]),
                trailing: Text("Kelvin"),
                selected: true,
                isThreeLine: true,
              );
            },
          ),
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.amberAccent,
              onPrimary: Colors.black, // foreground
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            child: Text('Ready'))
      ],
    );
  }
}
