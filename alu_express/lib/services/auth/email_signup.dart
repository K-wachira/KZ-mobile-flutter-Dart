import 'package:alu_express/main_screens/home.dart';
import 'package:alu_express/services/auth/Bussiness_logic.dart';
import 'package:alu_express/services/auth/email_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  bool _isHidden2 = true;
  bool _isHidden = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final authinstance = Authentificate();
  final getinstance = Get();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordMatch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Text("logo"),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Prevbutton"),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Create an account with us",
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  letterSpacing: .3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 26.0),
                              ),
                              Text(
                                "Get started for free",
                                style: GoogleFonts.raleway(
                                  color: Colors.grey[600],
                                  fontSize: 17.0,
                                  letterSpacing: .3,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.56,
                                width: MediaQuery.of(context).size.width * 0.74,
                                child: Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: TextFormField(
                                            controller: nameController,
                                            style: GoogleFonts.raleway(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              letterSpacing: .3,
                                            ),
                                            textCapitalization:
                                                TextCapitalization.words,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              labelText: "Name",
                                              labelStyle: GoogleFonts.raleway(
                                                color: Colors.black,
                                                letterSpacing: .2,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Please enter your name";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: TextFormField(
                                            style: GoogleFonts.raleway(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              letterSpacing: .3,
                                            ),
                                            controller: emailController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              labelText: "Email Address",
                                              labelStyle: GoogleFonts.raleway(
                                                color: Colors.black,
                                                letterSpacing: .2,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Mandatory Field, Enter an Email Address';
                                              } else if (!value.contains('@')) {
                                                return 'Your email lacks an @ sign. Please include a valid email address into this field';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: TextFormField(
                                            style: GoogleFonts.raleway(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              letterSpacing: .3,
                                            ),
                                            controller: passwordController,
                                            obscureText: _isHidden,
                                            decoration: InputDecoration(
                                              suffix: InkWell(
                                                onTap: _togglePasswordView,
                                                child: Icon(Icons.visibility),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              labelText: "Password",
                                              labelStyle: GoogleFonts.raleway(
                                                color: Colors.black,
                                                letterSpacing: .2,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Mandatory Field, Enter Password';
                                              } else if (value.length < 8) {
                                                return 'Password must be at least 8 characters!';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: TextFormField(
                                            style: GoogleFonts.raleway(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              letterSpacing: .3,
                                            ),
                                            controller: passwordMatch,
                                            obscureText: _isHidden2,
                                            decoration: InputDecoration(
                                              suffix: InkWell(
                                                onTap: _togglePasswordView2,
                                                child: Icon(Icons.visibility),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              labelText: "Confirm Password",
                                              labelStyle: GoogleFonts.raleway(
                                                color: Colors.black,
                                                letterSpacing: .2,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Please confirm your password';
                                              } else if (value !=
                                                  passwordController.text) {
                                                return 'Passwords do not match, try again';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 30),
                                          child: isLoading
                                              ? CircularProgressIndicator()
                                              : MaterialButton(
                                                  color: Colors.lightBlue[600],
                                                  splashColor: Colors.white,
                                                  onPressed: () {
                                                    if (_formKey.currentState
                                                        .validate()) {
                                                      setState(() {
                                                        isLoading = true;
                                                      });
                                                      _signupandsave();
                                                    }
                                                  },
                                                  child: Text(
                                                    "Register",
                                                    style: GoogleFonts.raleway(
                                                        color: Colors.white,
                                                        fontSize: 17.0,
                                                        letterSpacing: .4),
                                                  ),
                                                ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 20),
                                          child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EmailLogIn()),
                                                  );
                                                },
                                                child: Text(
                                                    "Already have an account?",
                                                    style: GoogleFonts.raleway(
                                                      fontSize: 15.0,
                                                      letterSpacing: .3,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  Future _getuser() async {
    dynamic user = await getinstance.userid();
    return user;
  }

  void _signupandsave() async {
    dynamic result = await authinstance.registerToFb(
        emailController.text, nameController.text, passwordController.text);
    if (result == true) {
      print("Registration successful");
      final userid = await _getuser();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home( uid: userid,)));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(result.toString()),
              actions: [
                RaisedButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
      setState(() => isLoading = false);
    }
    @override
    void dispose() {
      super.dispose();
      nameController.dispose();
      emailController.dispose();
      passwordController.dispose();
    }
  }
}
