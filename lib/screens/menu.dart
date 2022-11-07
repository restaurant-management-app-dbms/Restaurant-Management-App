import 'package:dbms_app/custom_classes/menu_card.dart';
import 'package:dbms_app/data_classes/items.dart';
import 'package:dbms_app/screens/new_order.dart';
import 'package:dbms_app/screens/waiter.dart';
import 'package:dbms_app/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  List<items> food_items = [
    items(
        image: 'assets/pizza.png',
        food: "Pizza",
        price: 500,
        category: "Main Course"),
    items(
        image: 'assets/pizza.png',
        food: "Pizza",
        price: 500,
        category: "Main Course"),
    items(
        image: 'assets/pizza.png',
        food: "Pizza",
        price: 500,
        category: "Main Course"),
    items(
        image: 'assets/pizza.png',
        food: "Pizza",
        price: 500,
        category: "Main Course"),
    items(
        image: 'assets/pizza.png',
        food: "Pizza",
        price: 500,
        category: "Main Course"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Colors.red,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: food_items.length,
                  itemBuilder: (((context, index) {
                    return menucard(item: food_items[index], icons: Icons.add);
                  }))),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => wrapper(
                              default_page: waiter(),
                              current_page: neworder())));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    fixedSize:
                        MaterialStateProperty.all(const Size(150.0, 35.0))),
                child: Text("Done",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
