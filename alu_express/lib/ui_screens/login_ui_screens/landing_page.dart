import 'package:alu_express/ui_screens/homepage_ui/size_helpers.dart';
import 'package:alu_express/ui_screens/login_ui_screens/vendor_signup.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Colors.white.withOpacity(0.2),
              Colors.white70.withOpacity(0.7),
            ],
            stops: [0.4, 1],
            begin: Alignment.topCenter,
          )),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.7,
          ),
          // left: displayWidth(context) * 0.05),
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            left: displayWidth(context) * 0.03)),
                    Text(
                      "Welcome to ",
                      style: GoogleFonts.ptSans(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 35,
                        letterSpacing: .3,
                      ),
                    ),
                    Text(
                      "ALU-Express, ",
                      style: GoogleFonts.ptSans(
                        color: Colors.red[900],
                        decoration: TextDecoration.none,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        letterSpacing: .3,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: displayWidth(context) * 0.04,
                          top: displayHeight(context) * 0.01),
                    ),
                    Text(
                      "Your number one Campus delivery point!",
                      style: GoogleFonts.ptSans(
                        color: Colors.black54,
                        fontSize: 18,
                        letterSpacing: .3,
                      ),
                    )
                  ],
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * 0.7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            primary: Colors.red[900]),
                        onPressed: () {},
                        child: Text(
                          'I am a Student',
                          style: GoogleFonts.ptSans(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.7,
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
                          'I am a Vendor',
                          style: GoogleFonts.ptSans(
                            color: Colors.black,
                            fontSize: 20,
                          ),
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
