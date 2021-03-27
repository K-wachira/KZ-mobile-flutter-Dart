import 'package:alu_express_student/ui_screens/cart.dart';
import 'package:alu_express_student/ui_screens/student_profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:alu_express_student/ui_screens/size_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';

class HomePage extends StatefulWidget {
  final uid;
  const HomePage({Key key, this.uid}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // Menu(uid: widget.userid,
  List<Widget> pages = [
    Cart(), StudentProfile() // TODO:
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              FlutterIcons.menu_fea,
              color: Colors.black,
            ),
            onPressed: () {}),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.05,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: displayWidth(context) * 0.7,
                  child: Text(
                    "Order from your favourite vendor below",
                    style: GoogleFonts.ptSans(
                        fontSize: 25,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3),
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Click on a vendor to view their full menu",
                  style: GoogleFonts.ptSans(
                      fontSize: 18, color: Colors.black54, letterSpacing: .3),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              Container(
                height: displayHeight(context) * 0.6,
                width: displayWidth(context) * 0.8,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: displayHeight(context) * 0.6,
                      width: displayWidth(context) * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red[900].withOpacity(.06)),
                    )
                  ],
                ),
              ),
            ],
          )),
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
                activeColor: Colors.red[900],
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
                    text: 'Cart',
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
