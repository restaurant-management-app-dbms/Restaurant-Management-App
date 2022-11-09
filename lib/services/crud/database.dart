import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbms_app/data_classes/user.dart';
import 'package:dbms_app/data_classes/menu_item.dart';
import 'package:dbms_app/data_classes/order_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dbms_app/global.dart';

class database {
  final FirebaseFirestore data = FirebaseFirestore.instance;

  // User Start
  Future createUser(
      {required String id,
      required String name,
      required String email,
      required String phone,
      required String role,
      required String username}) async {
    /// Reference to document
    final docUser = data.collection('Users').doc(id);
    final user = User(
      id: id,
      name: name,
      phone: phone,
      email: email,
      role: role,
      username: username,
    ); // User
    final json = user.toJson();

    /// Create document and write data to Firebase
    await docUser.set(json);

    return true;
  }
  // User End

  // Create Menu
  Future createMenuItem({
    required String itemName,
    required String category,
    required String pictureUrl,
    required String price,
  }) async {
    /// Reference to document
    final docUser = data.collection('Menu').doc();
    final menuItem = Menuitem(
      id: docUser.id,
      itemName: itemName,
      category: category,
      pictureUrl: pictureUrl,
      price: price,
    ); // User
    final json = menuItem.toJson();

    /// Create document and write data to Firebase
    await docUser.set(json);
  }

  //Get Name
  Future<String> getname(String userid) async {
    try {
      final user_details = data.collection('Users').doc(userid);
      String name = "";
      await user_details.get().then((snapshot) => {
            snapshot.data()?.forEach((key, value) {
              if (key == 'name') {
                name = value;
              }
            })
          });
      return name;
    } catch (e) {
      print("Error caused:${e}");
      return '';
    }
  }

  //Get role
  Future<String> getrole(String userid) async {
    try {
      final user_details = data.collection('Users').doc(userid);
      String role = "Waiter";
      await user_details.get().then((snapshot) => {
            snapshot.data()?.forEach((key, value) {
              if (key == 'role') {
                role = value;
              }
            })
          });
      return role;
    } catch (e) {
      print("Error caused:${e}");
      return '';
    }
  }

  //Update Order Status
  Future updatestatus(
      String orderid, String status, String role, String name) async {
    try {
      final order_details = data.collection('Orders').doc(orderid);

      late String role_status;
      late String role_name;

      if (role == "Waiter") {
        role_status = 'waiterStatus';
        role_name = 'waiterUsername';
      } else if (role == "Cook") {
        role_status = 'cookStatus';
        role_name = 'cookUsername';
      } else if (role == "Cashier") {
        role_status = 'cashierStatus';
        role_name = 'cashierUsername';
      }

      await order_details.update({role_status: status});
      await order_details.update({role_name: name});

      print("updated");
    } catch (e) {
      print("Error caused:${e}");
      return null;
    }
  }

  //Get Order Status
  Future<Map<String, dynamic>> getstatus(String orderid) async {
    try {
      final order_details = data.collection('Orders').doc(orderid);

      Map<String, dynamic> order_status = {'orderid': orderid};

      await order_details.get().then((snapshot) => {
            snapshot.data()?.forEach((key, value) {
              if (key != 'items') {
                final entry = {key: value};
                order_status.addEntries(entry.entries);
              }
            })
          });
      return order_status;
    } catch (e) {
      print("Error caused:${e}");
      return {};
    }
  }

  //Get Price
  Future<String> get_price(String orderid) async {
    try {
      final order_details = data.collection('Orders').doc(orderid);

      List<dynamic> items = [];
      int total_price = 0;

      await order_details.get().then((snapshot) => {
            snapshot.data()?.forEach((key, value) {
              if (key == 'items') {
                items = value;
              }
            })
          });

      for (var i = 0; i < items.length; i++) {
        total_price += int.parse(items[i]['price']);
      }

      print("Found total price");

      return total_price.toString();
    } catch (e) {
      print("Unable to get order items:${e}");
      return "";
    }
  }

  //Get item
  Future<dynamic> getitem(String orderid) async {
    try {
      final order_details = data.collection('Orders').doc(orderid);

      List<dynamic> items = [];

      await order_details.get().then((snapshot) => {
            snapshot.data()?.forEach((key, value) {
              if (key == 'items') {
                items = value;
              }
            })
          });

      print("Found Item");
      return items;
    } catch (e) {
      print("Unable to get order items:${e}");
      return [];
    }
  }

  //Add Order
  Future addorder(
      {required String waiter_name, required String table_number}) async {
    //To add the order
    try {
      final docUser = data.collection('Orders').doc();

      List<Map<String, dynamic>> orderitems = [];

      for (var i = 0; i < food_items.length; i++) {
        orderitems.add({
          'item': food_items[i].food,
          'price': food_items[i].price,
          'category': food_items[i].category
        });
      }
      Map<String, dynamic> neworder = {
        'cashierStatus': "",
        'cashierUsername': "",
        'cookStatus': "",
        'cookUsername': "",
        'lastUpdatedAt': DateTime.now().hour.toString() +
            ":" +
            DateTime.now().minute.toString(),
        'paymentStatus': "",
        'tableNumber': table_number,
        'waiterStatus': '',
        'waiterUsername': waiter_name,
        'items': orderitems
      };

      /// Create document and write data to Firebase
      await docUser.set(neworder);
    } catch (e) {
      print("Error:Invalid order:${e}");
    }
  }

//Get Menu
  Stream<List<Menuitem>> getAllMenuItems() {
    final habebe = data.collection('Menu').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => Menuitem.fromJson(doc.data()))
            .toList(growable: false));

    return habebe;
  }

  //Get Order
  Stream<List<Order>> getAllOrders() {
    return FirebaseFirestore.instance
        .collection('OrderDetails')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Order.fromJson(doc.data()))
            .toList(growable: false));
  }

  // Order End
}
