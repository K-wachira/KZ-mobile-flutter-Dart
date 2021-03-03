import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Feather.home,
            color: Color(0xFFDC2F02),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.shopping_cart,
            color: Colors.black,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.user,
            color: Colors.black,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Color(0xFFDC2F02),
    );
  }
}
