import 'package:alu_express/services/auth/bussiness_logic.dart';
import 'package:alu_express/ui_screens/home.dart';
import 'package:flutter/material.dart';

class EmailLogIn extends StatefulWidget {
  @override
  _EmailLogInState createState() => _EmailLogInState();
}

class _EmailLogInState extends State<EmailLogIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authclass = Authentificate();
  final getinstance = Get();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      "assets/images/emirates.png",
      fit: BoxFit.fill,
      width: 80.0,
      height: 80.0,
    );

    final welcomeImg = Image.asset(
      "assets/welcome.png",
      fit: BoxFit.fill,
      height: 120.0,
      width: 102.0,
    );

    final welcomeMsg = Column(
      children: <Widget>[
        Text(
          'Welcome Back to "ALU" App',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ],
    );

    return Scaffold(
        backgroundColor: Color(0xFFE1F5FE),
        appBar: AppBar(title: Text("Login to 'ALU' App")),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 40)),
              logo,
              Padding(padding: EdgeInsets.only(top: 30)),
              welcomeMsg,
              Padding(padding: EdgeInsets.only(bottom: 30)),
              welcomeImg,
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mandatory Field, Enter Your Email Address';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mandatory Field, Enter Your Password';
                    } else if (value.length < 8) {
                      return 'Password must be atleast 8 characters!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            _loginandsave();
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              )
            ]))));
  }

  Future _getuser() async {
    dynamic user = await getinstance.userid();
    return user;
  }

  void _loginandsave() async {
    dynamic result = await authclass.loginwithEmailandpass(
        emailController.text, passwordController.text);

    print(result);
    if (result == true) {
      print("Login successful");
      final userid = await _getuser();

      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(uid: userid,)));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(result.toString()),
              actions: [
                ElevatedButton(
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
  }
}
