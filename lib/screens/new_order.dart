import 'package:dbms_app/custom_classes/menu_card.dart';
import 'package:dbms_app/custom_classes/newordercard.dart';
import 'package:dbms_app/data_classes/items.dart';
import 'package:dbms_app/data_classes/menu_item.dart';
import 'package:flutter/material.dart';

class neworder extends StatefulWidget {
  @override
  State<neworder> createState() => _neworderState();
}

class _neworderState extends State<neworder> {
  String table_number = null.toString();
  String waiter = 'Thug';

  List<Menuitem> food_items = [];

  void initState() {
    for (var i = 1; i < 10; i++) {
      food_items.add(Menuitem(
          itemName: "Pizza", category: "Food", pictureUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg/800px-Eq_it-na_pizza-margherita_sep2005_sml.jpg", price: "50"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            new_ordercard(
                table_number:table_number, waiter: waiter, setState: setState),
            Center(
              child: Text("Items", style: TextStyle(fontSize: 30.0)),
            ),
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
                    return menucard(
                        item: food_items[index], icons: Icons.remove);
                  }))),
            )
          ],
        ),
      ),
    );
  }
}
