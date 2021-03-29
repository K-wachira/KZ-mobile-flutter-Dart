import 'package:alu_express_student/ui_screens/cart.dart';
import 'package:alu_express_student/ui_screens/homepage.dart';
import 'package:alu_express_student/ui_screens/notifications.dart';
import 'package:alu_express_student/ui_screens/size_helpers.dart';
import 'package:alu_express_student/ui_screens/student_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: displayHeight(context) * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.red[900],
                backgroundImage: AssetImage(''),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Nailah HK",
                style: GoogleFonts.ptSans(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text("nailahrocks@gmail.com",
                  style: GoogleFonts.ptSans(fontSize: 18)),
              SizedBox(height: 10.0),

              // Place Divider Here
              Divider(
                height: 20.0,
                color: Colors.red[900],
                thickness: 1,
              ),

              //Menu
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new StudentProfile()));
                },
                leading: Icon(
                  LineIcons.userEdit,
                  color: Colors.red[900],
                ),
                title: Text("Profile",
                    style: GoogleFonts.ptSans(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new HomePage()));
                },
                leading: Icon(
                  Icons.food_bank_outlined,
                  color: Colors.red[900],
                ),
                title: Text("Food List",
                    style: GoogleFonts.ptSans(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new Cart()));
                },
                leading: Icon(
                  LineIcons.shoppingCart,
                  color: Colors.red[900],
                ),
                title: Text("Cart",
                    style: GoogleFonts.ptSans(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Notifications()));
                },
                leading: Icon(
                  Icons.notifications_outlined,
                  color: Colors.red[900],
                ),
                title: Text("Notifications",
                    style: GoogleFonts.ptSans(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: displayHeight(context) * 0.15,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.logout,
                  color: Colors.red[900],
                ),
                title: Text("Log Out",
                    style: GoogleFonts.ptSans(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        )
      ],
    );
  }
}
