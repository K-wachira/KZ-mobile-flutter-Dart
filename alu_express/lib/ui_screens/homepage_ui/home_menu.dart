import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:alu_express/ui_screens/homepage_ui/appbar.dart';
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
                MenuCard(
                  link: "images/restaurant.png",
                  title: "My Menu",
                ),
                MenuCard(link: "images/cloche.png", title: "Create Menu"),
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
                MenuCard(
                    link: "images/best-price.png", title: "Deal of the Day"),
                MenuCard(link: "images/megaphone.png", title: "Promotions")
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
