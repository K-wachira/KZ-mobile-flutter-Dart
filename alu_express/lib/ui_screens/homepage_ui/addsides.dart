import 'package:alu_express/ui_screens/homepage_ui/addproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:alu_express/services/auth/menu_functions.dart';

TextStyle kFont = TextStyle(
    fontFamily: "PTSans", color: Colors.black, fontWeight: FontWeight.w500);

class AddSidesPage extends StatelessWidget {
  final prodId;
  AddSidesPage({@required this.prodId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent[700],
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(true),
          child: Icon(
            Feather.chevron_left,
            color: Colors.white,
          ),
        ),
        title: Padding(
          // TODO: Make the padding responsive
          padding: const EdgeInsets.fromLTRB(90.0, 0, 0, 0),
          child: Text(
            "Add Sides",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "PTSans",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FormBody(
        productID: prodId,
      ),
    );
  }
}

class FormBody extends StatefulWidget {
  final productID;
  FormBody({@required this.productID});
  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  TextEditingController nameVal = TextEditingController();
  TextEditingController costVal = TextEditingController();
  String name;
  String price;

  void initState() {
    super.initState();
    costVal.addListener(() {
      name = nameVal.text;
    });
    nameVal.addListener(() {
      price = costVal.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Sides';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 100, 20),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Feather.chevron_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'Sides',
                'Flavors',
                'Fillings',
                'Sizes',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
                controller: nameVal,
                decoration: InputDecoration(
                    labelStyle: kFont.copyWith(fontSize: 14),
                    labelText: "Product Name")),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              controller: costVal,
              decoration: InputDecoration(
                  labelStyle: kFont.copyWith(fontSize: 14),
                  labelText: "Product Cost"),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(0xFFFFCC00),
                onPressed: () {
                  setState(() {
                    Map<String, String> data = {
                      'name': name,
                      'price': price,
                      'productID': widget.productID.toString(),
                      'type': dropdownValue,
                    };
                    saveSide(data);
                    nameVal.clear();
                    costVal.clear();
                  });
                },
                child: Text(
                  "Add Side",
                  // style: kFont,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}
