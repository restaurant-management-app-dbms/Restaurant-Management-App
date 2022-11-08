import 'package:dbms_app/screens/add_user.dart';
import 'package:dbms_app/screens/menu.dart';
import 'package:dbms_app/screens/myorders.dart';
import 'package:dbms_app/screens/new_order.dart';
import 'package:dbms_app/screens/orders_page.dart';
import 'package:dbms_app/screens/waiter.dart';
import 'package:dbms_app/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

class button extends StatefulWidget {
  String data;
  button({required this.data});

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  Widget find_screen(String page) {
    if (page == "My Orders") {
      return myorders();
    } else if (page == "Menu") {
      return menu();
    } else if (page == "Orders") {
      return orders();
    } else if (page == "New Order") {
      return neworder();
    } else if (page == "Add User") {
      return adduser();
    }
    return waiter();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.0),
        ElevatedButton(
            onPressed: () {
              if (widget.data == "Waiter" ||
                  widget.data == "Cook" ||
                  widget.data == "Cashier") {
                Navigator.pop(context, widget.data);
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => wrapper(
                            default_page: waiter(),
                            current_page: find_screen(widget.data))));
              }
            },
            child: Text(
              widget.data,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[500]),
                fixedSize: MaterialStateProperty.all(const Size(150.0, 35.0)))),
      ],
    );
  }
}
