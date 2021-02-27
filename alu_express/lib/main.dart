import 'package:flutter/material.dart';
import 'package:alu_express/ui_screens/home.dart';
import 'package:alu_express/ui_screens/login_ui_screens/email_login.dart';
import 'package:alu_express/ui_screens/login_ui_screens/email_signup.dart';
import 'package:alu_express/ui_screens/login_ui_screens/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => LandingPage(),
          "/home": (context) => Home(),
          "/login": (context) => EmailLogIn(),
          "/signup": (context) => EmailSignUp(),
        });
  }
}