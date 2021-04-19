import 'package:alu_express/ui_screens/extras/deal_of_the_day.dart';
import 'package:alu_express/ui_screens/extras/promotions.dart';
import 'package:alu_express/ui_screens/menu_pages/new_build/add_food.dart';
import 'package:alu_express/ui_screens/menu_pages/new_build/vendor_menu.dart';
import 'package:alu_express/ui_screens/orders_ui/dashboards/dashboard_card_view.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final userID;
  const Menu({Key key, this.userID}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Home",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "PTSans",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Meze Fresh",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFDC2F02),
                  fontSize: 18,
                  fontFamily: "PTSans"),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VendorMenu(
                                    userid: widget.userID,
                                  )));
                    });
                  },
                  child: MenuCard(
                    link: "images/restaurant.png",
                    title: "My Menu",
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddFood(
                                      userid: widget.userID,
                                    )));
                      });
                    },
                    child: MenuCard(
                        link: "images/cloche.png", title: "Create Menu")),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: MediterranesnDietView(
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / 9) * 1, 1.0,
                          curve: Curves.fastOutSlowIn))),
              animationController: animationController,
            ),
          )
        ]),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    @required this.link,
    @required this.title,
    Key key,
  }) : super(key: key);

  final String link;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(link, width: 40.0),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'PTSans',
                fontSize: 16.0,
              ),
            )
          ],
        ));
  }
}
