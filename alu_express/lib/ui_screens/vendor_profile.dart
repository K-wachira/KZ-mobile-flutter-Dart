import 'package:alu_express/services/auth/bussiness_logic.dart';
import 'package:alu_express/ui_screens/home.dart';
import 'package:alu_express/ui_screens/login_ui_screens/vendor_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alu_express/ui_screens/size_helpers.dart';
import 'package:alu_express/ui_screens/bottom_nav.dart';

class VendorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.chevron_left_rounded,
          color: Colors.black,
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(90.0, 0, 0, 0),
          child: Text(
            "Profile",
            style: TextStyle(
                color: Colors.black, fontFamily: "PTSans", fontSize: 22),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: displayHeight(context) * 0.25,
                width: displayWidth(context) * 0.3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 25,
                      child: SizedBox(
                        height: displayHeight(context) * 0.1,
                        width: displayWidth(context) * 0.1,
                        child: CircleAvatar(
                          backgroundColor: Colors.white54,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {},
                            child: Icon(Icons.camera_alt_rounded,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vendor Name",
                    style: GoogleFonts.ptSans(
                        letterSpacing: .3, fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(
                      width: displayWidth(context) * 0.9,
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.red[900])),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red[900]),
                                borderRadius: BorderRadius.circular(50))),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Vendor Location",
                    style: GoogleFonts.ptSans(
                        letterSpacing: .3, fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(
                      width: displayWidth(context) * 0.9,
                      child: TextField(
                        cursorColor: Colors.black,
                        style: GoogleFonts.ptSans(
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: .3,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.red[900])),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red[900]),
                                borderRadius: BorderRadius.circular(50))),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Open Hours",
                    style: GoogleFonts.ptSans(
                        letterSpacing: .3, fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(
                      width: displayWidth(context) * 0.9,
                      child: TextField(
                        cursorColor: Colors.black,
                        style: GoogleFonts.ptSans(
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: .3,
                        ),
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.red[900])),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red[900]),
                                borderRadius: BorderRadius.circular(50))),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
