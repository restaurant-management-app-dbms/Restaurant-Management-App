import 'package:dbms_app/custom_classes/decorations.dart';
import 'package:dbms_app/custom_classes/menu_card.dart';
import 'package:dbms_app/data_classes/items.dart';
import 'package:dbms_app/screens/menu.dart';
import 'package:dbms_app/screens/waiter.dart';
import 'package:dbms_app/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

class new_ordercard extends StatefulWidget {
  String quantity;
  String waiter;
  Function setState;
  String error = '';

  new_ordercard(
      {required this.quantity, required this.waiter, required this.setState});

  @override
  State<new_ordercard> createState() => _new_ordercardState();
}

class _new_ordercardState extends State<new_ordercard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(35.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Container(
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text("New Order", style: TextStyle(fontSize: 30.0)),
            ),
            SizedBox(height: 5.0),
            Text("Waiter:${widget.waiter}",
                textAlign: TextAlign.start, style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 10.0),
            Text("Enter Table Number:",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 15.0),
            TextField(
              textAlign: TextAlign.center,
              decoration: decorations()
                  .formDecor()
                  .copyWith(hintText: "Enter Table Number"),
              onChanged: (credential) {
                widget.quantity = credential;
              },
              showCursor: true,
            ),
            Column(
              children: [
                SizedBox(height: 2.0),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => wrapper(
                                    default_page: waiter(),
                                    current_page: menu())));
                      },
                      child: Text(
                        "Edit Order",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[500]),
                          fixedSize: MaterialStateProperty.all(
                              const Size(150.0, 35.0)))),
                ),
                SizedBox(height: 2.0),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (widget.quantity == null.toString()) {
                          setState(() {
                            widget.error = "Enter Table Number";
                          });
                        }
                      },
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[500]),
                          fixedSize: MaterialStateProperty.all(
                              const Size(150.0, 35.0)))),
                ),
                Text(
                  widget.error,
                  style: TextStyle(color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
