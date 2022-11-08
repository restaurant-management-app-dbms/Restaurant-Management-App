import 'package:dbms_app/custom_classes/order_card.dart';
import 'package:dbms_app/data_classes/order_details.dart';
import 'package:flutter/material.dart';

class myorders extends StatelessWidget {
  List<order_data> order = [
    order_data(
        order_image: 'assets/order.png',
        orderid: 45,
        table_num: 3,
        last_update: "3:30"),
    order_data(
        order_image: 'assets/order.png',
        orderid: 45,
        table_num: 3,
        last_update: "3:30"),
    order_data(
        order_image: 'assets/order.png',
        orderid: 45,
        table_num: 3,
        last_update: "3:30"),
    order_data(
        order_image: 'assets/order.png',
        orderid: 45,
        table_num: 3,
        last_update: "3:30"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: order.length,
        itemBuilder: (((context, index) {
          return order_details(orders: order[index]);
        })));
  }
}
