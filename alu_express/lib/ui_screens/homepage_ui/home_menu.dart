import 'package:alu_express/ui_screens/homepage_ui/deal_of_the_day.dart';
import 'package:alu_express/ui_screens/homepage_ui/my_menu.dart';
import 'package:alu_express/ui_screens/homepage_ui/new_menu.dart';
import 'package:alu_express/ui_screens/homepage_ui/promotions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:alu_express/ui_screens/homepage_ui/bottom_nav.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Home",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "PTSans",
              fontWeight: FontWeight.bold),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyMenu()));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NewMenu()));
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DealOfTheDay()));
                    });
                  },
                  child: MenuCard(
                      link: "images/best-price.png", title: "Deal of the Day"),
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Promotions()));
                      });
                    },
                    child: MenuCard(
                        link: "images/megaphone.png", title: "Promotions"))
              ],
            ),
          )
        ]),
        // //TODO: Fix Switch
        //   Switch(

        //     value: isSwitched,
        //     onChanged: (isSwitched){
        //         setState(() {
        //           !isSwitched;
        //         });
        //     },
        //     activeColor: Colors.white,
        //     activeTrackColor: Colors.yellow,
        //     inactiveThumbColor: Colors.grey,
        //     inactiveTrackColor: Colors.white,
        //         ),
      ),
      bottomNavigationBar: BottomNav(),
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
