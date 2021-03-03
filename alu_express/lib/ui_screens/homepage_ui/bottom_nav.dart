import 'package:alu_express/ui_screens/homepage_ui/home_menu.dart';
import 'package:alu_express/ui_screens/homepage_ui/new_menu.dart';
import 'package:alu_express/ui_screens/homepage_ui/vendor_profile.dart';
import 'package:alu_express/ui_screens/orders_ui/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  List<Widget> pages = [HomeMenu(), Orders(), VendorProfile()];

  @override
  Widget build(BuildContext context) {
    void _onItemTap(int index) {
      setState(() {
        _selectedIndex = index;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => pages[_selectedIndex]));
      });
    }

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Feather.home,
            color: Color(0xFFDC2F02),
          ),
          icon: Icon(
            Feather.home,
            color: Colors.black,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Feather.shopping_cart,
            color: Color(0xFFDC2F02),
          ),
          icon: Icon(
            Feather.shopping_cart,
            color: Colors.black,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Feather.user,
            color: Color(0xFFDC2F02),
          ),
          icon: Icon(
            Feather.user,
            color: Colors.black,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
      selectedItemColor: Color(0xFFDC2F02),
    );
  }
}
