import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbms_app/data_classes/user.dart';
import 'package:dbms_app/data_classes/menu_item.dart';
import 'package:dbms_app/data_classes/order_details.dart';
import 'package:firebase_core/firebase_core.dart';

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

  // Menu Start
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

  Future addorder(
      {required String waiter, required String table_number}) async {
    /// Reference to document
    final docUser = data.collection('OrderDetails').doc();

    Map<String, dynamic> neworder = {
      'Waiter': waiter,
      'Last Update': DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      'Order ID': Random().nextInt(100).toString(),
      'Table Number': table_number
    };

    /// Create document and write data to Firebase
    await docUser.set(neworder);
  }

  Stream<List<Menuitem>> getAllMenuItems() {
    final habebe = data.collection('Menu').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => Menuitem.fromJson(doc.data()))
            .toList(growable: false));

    return habebe;
  }

  // Menu End

  // Order Start

  Future createOrder({
    required String waiterUsername,
    required String waiterStatus,
    required String tableNumber,
  }) async {
    /// Reference to document
    final docUser = FirebaseFirestore.instance.collection('Users').doc();
    final order = Order(
      id: docUser.id,
      waiterUsername: waiterUsername,
      waiterStatus: waiterStatus,
      tableNumber: tableNumber,
    ); // User
    final json = order.toJson();

    /// Create document and write data to Firebase
    await docUser.set(json);
  }

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
