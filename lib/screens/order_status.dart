import 'package:dbms_app/custom_classes/form_fields.dart';
import 'package:flutter/material.dart';

class order_status extends StatefulWidget {
  @override
  State<order_status> createState() => orderstatusState();
}

class orderstatusState extends State<order_status> {
  String orderID = '234123345';
  String TotalAmount = '2343';
  String waiter_status = '';
  String cook_status = '';
  String cashier_status = '';
  String table_no = '';
  String last_updated = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    return Center(
          child: Card(
            margin: EdgeInsets.all(25.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            elevation: 8.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Order",
                      style: TextStyle(color: Colors.black, fontSize: 30.0)),
                  SizedBox(height: 10.0),
                  Text("OrderID:", style: TextStyle(fontSize: 20.0)),
                  Card(
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                          width: 200.0,
                          child: Text(orderID,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0)))),
                  SizedBox(height: 10.0),
                  Text("Total Amount:", style: TextStyle(fontSize: 20.0)),
                  Card(
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                          width: 200.0,
                          child: Text(TotalAmount,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0)))),
                  SizedBox(height: 10.0),
                  Text("Waiter:", style: TextStyle(fontSize: 20.0)),
                  Card(
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                        width: 200.0,
                        child: Text(waiter_status,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0)),
                      )),
                  SizedBox(height: 10.0),
                  Text("Cook:", style: TextStyle(fontSize: 20.0)),
                  Card(
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                          width: 200.0,
                          child: Text(cook_status,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0)))),
                  SizedBox(height: 10.0),
                  Text("Cashier:", style: TextStyle(fontSize: 20.0)),
                  Card(
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                        width: 200.0,
                        child: Text(cashier_status,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0)),
                      )),
                  SizedBox(height: 10.0),
                  Text("Table Number:", style: TextStyle(fontSize: 20.0)),
                  Card(
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                          width: 200.0,
                          child: Text(table_no,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0)))),
                  SizedBox(height: 10.0),
                  Text("Last Update At:", style: TextStyle(fontSize: 20.0)),
                  Card(
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                          width: 200.0,
                          child: Text(last_updated,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0)))),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[500]),
                          fixedSize: MaterialStateProperty.all(
                              const Size(150.0, 35.0))),
                      child: Text("Update Status",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  ElevatedButton(
                      onPressed: () async {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[500]),
                          fixedSize: MaterialStateProperty.all(
                              const Size(150.0, 35.0))),
                      child: Text("Confirm",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ),
        );
  }
}
