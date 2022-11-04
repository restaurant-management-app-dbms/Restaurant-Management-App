import 'package:dbms_app/screens/login.dart';
import 'package:dbms_app/screens/waiter.dart';
import 'package:flutter/material.dart';
import 'package:dbms_app/screens/login.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, routes: {
      "/": (context) => login(),
      "/waiter": (context) => waiter(),
    }),
  );
}
