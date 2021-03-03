import 'package:flutter/material.dart';

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
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_sharp,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.red[900],
    );
  }
}