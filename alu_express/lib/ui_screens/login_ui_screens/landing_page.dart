import 'package:alu_express/services/bloc/auth/bussiness_logic.dart';
import 'package:flutter/material.dart';

// We can check if the user is logged in  or not and redirect to  the approp page.
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String userId;
  bool isLoggedIn = false;

  final getinstance = Get();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getinstance.getCurrentUser();

    
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoggedIn) {
      return Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/login",
                );
              },
            ),
            ElevatedButton(
              child: Text("Signin"),
              onPressed: () {
                Navigator.pushNamed(context, "/signup");
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
    } else {
      Navigator.pushNamed(context, "/home");
    }
  }
}
