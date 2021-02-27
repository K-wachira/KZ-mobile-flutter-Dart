import 'package:alu_express/ui_screens/login_ui_screens/email_login.dart';
import 'package:alu_express/ui_screens/login_ui_screens/email_signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// We can check if the user is logged in  or not and redirect to  the approp page.
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String userId;

  bool isLoggedIn = false;

  Future<void> getCurrentUser() async {
    User userdata = FirebaseAuth.instance.currentUser;
//    cross check is the user id is not null and is more than 5 characters (normal uid from firebase is 25 characters plus
    if (((userdata.uid).length) > 5) {
      setState(() {
        print(userdata.uid);
        userId = userdata.uid;
//        islogged in is set to true showing that user is logged in
        isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: Text("Login"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmailLogIn()),
              );
            },
          ),
          ElevatedButton(
            child: Text("Signin"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmailSignUp()),
              );
            },
          ),
          ElevatedButton(
            child: Icon(Icons.one_k),
            onPressed: () {},
          ),
          ElevatedButton(
            child: Icon(Icons.one_k),
            onPressed: () {},
          ),
          ElevatedButton(
            child: Icon(Icons.one_k),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
