import 'package:alu_express/main_screens/login_ui_screens/email_login.dart';
import 'package:alu_express/main_screens/login_ui_screens/email_signup.dart';
import 'package:flutter/material.dart';

// We can check if the user is logged in  or not and redirect to  the approp page.
class LandingPage extends StatelessWidget {
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
