import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbms_app/data_classes/user.dart';
import 'package:firebase_core/firebase_core.dart';

class database {
  final FirebaseFirestore data = FirebaseFirestore.instance;

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
}
