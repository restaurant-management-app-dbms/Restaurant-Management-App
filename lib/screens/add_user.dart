import 'package:dbms_app/custom_classes/decorations.dart';
import 'package:dbms_app/custom_classes/form_fields.dart';
import 'package:flutter/material.dart';

class adduser extends StatefulWidget {
  @override
  State<adduser> createState() => adduserState();
}

class adduserState extends State<adduser> {
  String Name = '';
  String Password = '';
  String Username = '';
  String Email = '';
  String Phone = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    void set_credential(String type, String data) {
      if (type == "Name") {
        Name = data;
      } else if (type == "Password") {
        Password = data;
      } else if (type == "Username") {
        Username = data;
      } else if (type == "Email") {
        Email = data;
      } else if (type == "Phone") {
        Phone = data;
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Form(
            key: _key,
            child: Card(
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              elevation: 8.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Add User",
                      style: TextStyle(color: Colors.black, fontSize: 30.0)),
                  form_field("Name", set_credential),
                  form_field("Password", set_credential),
                  form_field("Username", set_credential),
                  form_field("Email", set_credential),
                  form_field("Phone", set_credential),
                  Text(
                    "Select Role",
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[500]),
                          fixedSize: MaterialStateProperty.all(
                              const Size(150.0, 35.0))),
                      child: Text("Select Role",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate() == true) {
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
                      child: Text("Confirm",
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
        ));
  }
}
