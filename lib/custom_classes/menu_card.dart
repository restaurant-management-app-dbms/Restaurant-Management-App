import 'package:dbms_app/data_classes/items.dart';
import 'package:dbms_app/data_classes/menu_item.dart';
import 'package:flutter/material.dart';

class menucard extends StatelessWidget {
  Menuitem item;
  IconData icons;

  menucard({required this.item, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        elevation: 10.0,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset('assets/pizza.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 88,
                  child: Text(
                    "Food Name:${item.itemName}",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 5.0),
                Text("Price:Rs ${item.price}"),
                SizedBox(height: 5.0),
                Text("Category:${item.category}")
              ],
            ),
          ),
          SizedBox(width: 50.0),
          Container(
            width: 50.0,
            //padding: EdgeInsets.all(8.0),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  if (icons == Icons.add) {
                    Navigator.pushNamed(context, "/add_item");
                  }
                },
                child: Icon(icons, color: Colors.white)),
          )
        ]));
  }
}
