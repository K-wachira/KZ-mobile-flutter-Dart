import 'package:alu_express_student/services/Models/firebase_services.dart';
import 'package:alu_express_student/services/Models/user_model.dart';
import 'package:alu_express_student/ui_screens/cart_pages/card_item.dart';
import 'package:alu_express_student/ui_screens/profile_pages/change_profile_popup.dart';
import 'package:alu_express_student/ui_screens/shared_widgets/size_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentProfile extends StatefulWidget {
  final userid;
  StudentProfile({Key key, this.userid}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  final FirebaseServices firebaseServices = FirebaseServices();

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamProvider(
          create: (BuildContext context) =>
              firebaseServices.getuser(widget.userid),
          child: UserProfile(),
        ),
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    List userList = Provider.of<List<UserModel>>(context);
    print(userList);
    return Align(
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
                    child: Image.network(userList[0].profileUrl),
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
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    ProfilePicEdit(
                                      docId: userList[0].documentId,
                                    ));
                          },
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
              userData: userList[0].fname,
            ),
            SizedBox(
              height: displayHeight(context) * .03,
            ),
            CardItem(
              textItem: 'Email Address',
              userData: userList[0].email,
            ),
            SizedBox(
              height: displayHeight(context) * .03,
            ),
            CardItem(
              textItem: 'Phone Number',
              userData: userList[0].phoneNumber,
            )
          ],
        ),
      ),
    );
  }
}
