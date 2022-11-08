import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbms_app/data_classes/user.dart';
import 'package:dbms_app/data_classes/menu_item.dart';
import 'package:dbms_app/data_classes/orders.dart';
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
    final docUser = FirebaseFirestore.instance.collection('Menu').doc();
    final menuItem = MenuItem(
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

  Stream<List<MenuItem>> getAllMenuItems() {
    return FirebaseFirestore.instance.collection('Orders').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => MenuItem.fromJson(doc.data()))
            .toList(growable: false));
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
    return FirebaseFirestore.instance.collection('Orders').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => Order.fromJson(doc.data()))
            .toList(growable: false));
  }

  // Order End
}
