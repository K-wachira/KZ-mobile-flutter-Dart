import 'package:alu_express/ui_screens/homepage_ui/home_page.dart';
import 'package:alu_express/ui_screens/login_ui_screens/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Define an async function to initialize FlutterFire
  String userId;

  Future checkIfLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = await prefs.getString('userID');
    print(userid);
    return userid.toString();
  }

    @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {});
    print(checkIfLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALU Express',
      home: checkIfLoggedIn() == null
          ? LandingPage()
          : HomePage(userid: checkIfLoggedIn()), // AddProductsPage()
      debugShowCheckedModeBanner: false,
    );
  }
}
