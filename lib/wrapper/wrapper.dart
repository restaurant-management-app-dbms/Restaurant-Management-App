import 'package:dbms_app/screens/add_user.dart';
import 'package:dbms_app/screens/menu.dart';
import 'package:dbms_app/screens/myorders.dart';
import 'package:dbms_app/screens/new_order.dart';
import 'package:dbms_app/screens/orders_page.dart';
import 'package:dbms_app/screens/waiter.dart';
import 'package:dbms_app/services/authentication/authenticate.dart';
import 'package:flutter/material.dart';

class wrapper extends StatefulWidget {
  Widget default_page;
  Widget current_page;

  wrapper({required this.default_page, required this.current_page});

  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  List<String> screens = [
    "Home",
    "My Orders",
    "Menu",
    "Orders",
    "New Order",
    "Log Out"
  ];

  void find_screen(String page) {
    if (page == "Home") {
      widget.current_page = widget.default_page;
    }
    if (page == "My Orders") {
      widget.current_page = myorders();
    } else if (page == "Menu") {
      widget.current_page = menu();
    } else if (page == "Orders") {
      widget.current_page = orders();
    } else if (page == "New Order") {
      widget.current_page = neworder();
    } else if (page == "Add User") {
      widget.current_page = adduser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
          backgroundColor: Colors.red[500],
        ),
        drawer: Drawer(
            child: ListView.builder(
                itemCount: screens.length,
                itemBuilder: (((context, index) {
                  return Column(
                    children: [
                      ListTile(
                        tileColor: Colors.red,
                        title: Text(screens[index],
                            style: TextStyle(color: Colors.white)),
                        onTap: () async {
                          if (screens[index] == "Log Out") {
                            await auth().signout();
                            Navigator.pushReplacementNamed(context, "/login");
                          } else {
                            setState(() {
                              find_screen(screens[index]);
                              Navigator.pop(context);
                            });
                          }
                        },
                      ),
                      Divider(height: 10.0, thickness: 5.0, color: Colors.black)
                    ],
                  );
                })))),
        body: widget.current_page);
  }
}
