import 'package:alu_express/ui_screens/homepage_ui/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MyMenu extends StatefulWidget {
  final userId;

  const MyMenu({Key key, this.userId}) : super(key: key);

  @override
  _MyMenuState createState() => _MyMenuState();
}

final kstyle = TextStyle(
    color: Colors.black,
    fontFamily: "Roboto",
    fontSize: 14,
    fontWeight: FontWeight.w300);

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(color: Colors.black, fontFamily: "PTSans"),
              indicatorColor: Colors.red,
              tabs: [
                Tab(
                  text: "Quesedillas",
                ),
                Tab(
                  text: "Burritos",
                ),
                Tab(text: "Drinks")
              ],
              onTap: (index) => {selectedIndex = index},
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Icon(
              Feather.chevron_left,
              color: Colors.black,
            ),
            title: Padding(
              padding: const EdgeInsets.fromLTRB(90.0, 0, 0, 0),
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "PTSans",
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(
                  "AXpress",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Satisfy",
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(children: [
                Container(
                  height: 100,
                  width: 200,
                  child: Image(
                    image: new AssetImage(
                      "images/burrito.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Type",
                          style: kstyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Bowl",
                              style: kstyle,
                            ),
                            Checkbox(value: false, onChanged: (bool val) {}),
                            Text(
                              "Wrap",
                              style: kstyle,
                            ),
                            Checkbox(value: false, onChanged: (bool val) {}),
                          ],
                        ),
                        Text(
                          "Filling",
                          style: kstyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Beef",
                              style: kstyle,
                            ),
                            Checkbox(value: false, onChanged: (bool val) {}),
                            Text(
                              "Chicken",
                              style: kstyle,
                            ),
                            Checkbox(value: false, onChanged: (bool val) {}),
                          ],
                        ),
                        Text(
                          "Extras",
                          style: kstyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Cheese",
                              style: kstyle,
                            ),
                            Checkbox(value: false, onChanged: (bool val) {}),
                            Text(
                              "Beans",
                              style: kstyle,
                            ),
                            Checkbox(value: false, onChanged: (bool val) {}),
                          ],
                        ),
                        Text(
                          "TOTAL:",
                          style: kstyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ]),
                )
              ])),
          bottomNavigationBar: BottomNav(),
        ),
      ),
    );
  }
}
