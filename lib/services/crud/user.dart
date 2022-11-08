class User {
  String id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String username;

  User({
    this.id = '',
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'role': role,
        'username': username,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        role: json['role'],
        username: json['username'],
      );
}

Future createUser(
    {required String name,
    required String email,
    required String phone,
    required String role,
    required String username}) async {
  /// Reference to document
  final docUser = FirebaseFirestore.instance.collection('Users').doc();
  final user = User(
    id: docUser.id,
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
