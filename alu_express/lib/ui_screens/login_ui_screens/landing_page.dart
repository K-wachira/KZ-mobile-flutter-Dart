import 'package:alu_express/ui_screens/login_ui_screens/vendor_signup.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alu_express/ui_screens/size_helpers.dart';

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
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bkg.jpg"),
            fit: BoxFit.cover,
          ),
        )),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.4),
              Colors.white70.withOpacity(0.7),
            ],
            stops: [0.0, 1],
            begin: Alignment.topCenter,
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 250.0),
          child: Align(
            child: Column(
              children: <Widget>[
                Text(
                  "ALU-Express",
                  style: TextStyle(
                      color: Colors.red[900],
                      decoration: TextDecoration.none,
                      fontStyle: FontStyle.italic,
                      fontSize: 40,
                      fontFamily: "PTSerif Bold"),
                ),
                SizedBox(height: displayHeight(context) * 0.3),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * 0.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            primary: Colors.red[900]),
                        onPressed: () {},
                        child: Text(
                          'Student',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'PTSerif Bold'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          primary: Colors.amber,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VendorSignUp()),
                          );
                        },
                        child: Text(
                          'Vendor',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'PTSerif Bold'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
