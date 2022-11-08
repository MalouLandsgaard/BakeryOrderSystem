import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String id;
  String customerId;
  int orderNo;
  Timestamp timestamp;
  Map<String, int> items;
  OrderStatus status;
  String comment;

  Order(this.id,
      {required this.customerId,
      required this.orderNo,
      required this.timestamp,
      required this.items,
      required this.status,
      required this.comment});

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'orderNo': orderNo,
      'timestamp': timestamp,
      'items': items,
      'status': status.toMap(),
      'comment': comment,
    };
  }

  Order.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        customerId = doc.data()!["customerId"],
        orderNo = doc.data()!["orderNo"],
        timestamp = doc.data()!["timestamp"],
        items = doc.data()!["items"],
        status = OrderStatus.fromMap(doc.data()!["status"]),
        comment = doc.data()!["comment"];
}

class OrderStatus {
  OrderStatusOptions orderStatus;
  DateTime timestamp;

  OrderStatus(this.orderStatus, this.timestamp);

  Map<String, dynamic> toMap() {
    return {
      'orderStatus': orderStatus,
      'timestamp': timestamp,
    };
  }

  OrderStatus.fromMap(Map<String, dynamic> doc)
      : orderStatus = doc["orderStatus"],
        timestamp = doc["timestamp"];
}

enum OrderStatusOptions { received, acknowledged, completed }
