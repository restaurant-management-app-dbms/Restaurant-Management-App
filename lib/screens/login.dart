import 'package:dbms_app/custom_classes/decorations.dart';
import 'package:dbms_app/custom_classes/form_fields.dart';
import 'package:dbms_app/screens/waiter.dart';
import 'package:dbms_app/services/authentication/authenticate.dart';
import 'package:dbms_app/wrapper/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => loginState();
}

class loginState extends State<login> {
  String Email = '';
  String Password = '';
  String error = '';

  auth authenticate = auth();
  String? userid;

  @override
  Widget build(BuildContext context) {
    decorations decoration = decorations();

    final _key = GlobalKey<FormState>();

    void set_credential(String type, String data) {
      if (type == "Username") {
        Email = data;
      } else {
        Password = data;
      }
    }

    Future<void> validate_user(String Email, String Password) async {
      userid = await authenticate.signinwithemailandpassword(Email, Password);

      if (userid != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    wrapper(default_page: waiter(), current_page: waiter())));
      } else {
        setState(() {
          error = "INVALID CREDENTIALS";
        });
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: decoration.login_decor(),
          child: Form(
            key: _key,
            child: Center(
              child: Card(
                margin: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0)),
                    SizedBox(height: 30.0),
                    form_field("Username", set_credential),
                    SizedBox(height: 10.0),
                    form_field("Password", set_credential),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                        onPressed: () async {
                          if (_key.currentState!.validate() == true) {
                            validate_user(Email, Password);
                          } else {
                            setState(() {
                              error = "INVALID CREDENTIALS";
                            });
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red[500]),
                            fixedSize: MaterialStateProperty.all(
                                const Size(150.0, 35.0))),
                        child: Text("Sign in",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    Text(error,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
