import 'package:alu_express/ui_screens/homepage_ui/addcategory.dart';
import 'package:alu_express/ui_screens/homepage_ui/deal_of_the_day.dart';
import 'package:alu_express/ui_screens/homepage_ui/my_menu.dart';
import 'package:alu_express/ui_screens/homepage_ui/promotions.dart';
import 'package:alu_express/ui_screens/homepage_ui/profile_pages/vendor_profile.dart';
import 'package:alu_express/ui_screens/orders_ui/orders.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  final userid;
  const HomePage({Key key, this.userid}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  // Menu(uid: widget.userid,
  List<Widget> pages = [Menu(uid: null,), Orders(), VendorProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: GNav(
                rippleColor: Colors.grey[300],
                hoverColor: Colors.grey[100],
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100],
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.shoppingCart,
                    text: 'Orders',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  final uid;

  const Menu({Key key, this.uid}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
                              builder: (context) => MyMenu(userId: "123")));
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
                                builder: (context) =>
                                    AddMenu(userID: widget.uid)));
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
