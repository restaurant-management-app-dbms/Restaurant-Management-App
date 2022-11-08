class Order {
  String id;
  String paymentStatus;
  String cashierUsername;
  String cookStatus;
  String cookUsername;
  final String tableNumber;
  final String waiterStatus;
  final String waiterUsername;
  final String lastUpdatedAt;

  Order({
    this.id = '',
    this.paymentStatus = "Pending",
    this.cashierUsername = "None",
    this.cookStatus = "Pending",
    this.cookUsername = "None",
    this.lastUpdatedAt = '',
    required this.waiterUsername,
    required this.waiterStatus,
    required this.tableNumber,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'paymentStatus': paymentStatus,
        'cashierUsername': cashierUsername,
        'cookStatus': cookStatus,
        'cookUsername': cookUsername,
        'tableNumber': tableNumber,
        'waiterStatus': waiterStatus,
        'waiterUsername': waiterUsername,
      };

  static Order fromJson(Map<String, dynamic> json) => Order(
        id: json['id'],
        paymentStatus: json['paymentStatus'],
        cashierUsername: json['cashierUsername'],
        cookStatus: json['cookStatus'],
        cookUsername: json['cookUsername'],
        tableNumber: json['tableNumber'],
        waiterStatus: json['waiterStatus'],
        waiterUsername: json['waiterUsername'],
      );
}

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
