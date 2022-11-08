import 'dart:async';
import 'package:bakery_order_system/config/setup/ioc.dart';
import 'package:bakery_order_system/features/orders/domain/order.dart';
import 'package:bakery_order_system/features/products/domain/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository {
  final FirebaseFirestore _db = IOC.injectSync<FirebaseFirestore>('firestore');

  Future<void> addOrderData(Product product) async {
    return await _db
        .collection("products")
        .doc(product.id)
        .set(product.toMap());
  }

  Future<void> deleteProductData(Product product) async {
    return await _db.collection("products").doc(product.id).delete();
  }

  Stream<List<Order>> streamOrders() {
    return _db.collection("products").snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Order.fromDocumentSnapshot(doc)).toList());
  }
}
