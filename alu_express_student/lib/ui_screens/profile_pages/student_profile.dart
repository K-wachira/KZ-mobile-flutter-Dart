import 'package:alu_express_student/ui_screens/profile_pages/card_item.dart';
import 'package:alu_express_student/ui_screens/shared_widgets/size_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.chevron_left_rounded,
          color: Colors.black,
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(100.0, 0, 0, 0),
          child: Text(
            "Profile",
            style: GoogleFonts.ptSans(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
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
                      bottom: 20,
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
                height: displayHeight(context) * .03,
                child: (Text(
                  'Hello there, ',
                  style: GoogleFonts.ptSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                      color: Colors.red[900]),
                )),
              ),
              SizedBox(
                height: displayHeight(context) * .03,
              ),
              CardItem(
                textItem: 'FullName',
                userData: 'Student User',
              ),
              SizedBox(
                height: displayHeight(context) * .03,
              ),
              CardItem(
                textItem: 'Email Address',
                userData: 'student@gmail.com',
              ),
              SizedBox(
                height: displayHeight(context) * .03,
              ),
              CardItem(
                textItem: 'Phone Number',
                userData: '+2541546712',
              )
            ],
          ),
        ),
      ),
    );
  }
}
