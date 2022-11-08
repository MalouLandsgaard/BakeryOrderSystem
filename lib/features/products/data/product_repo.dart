import 'dart:async';
import 'package:bakery_order_system/config/setup/ioc.dart';
import 'package:bakery_order_system/features/products/domain/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final FirebaseFirestore _db = IOC.injectSync<FirebaseFirestore>('firestore');

  Future<void> addProductData(Product product) async {
    return await _db
        .collection("products")
        .doc(product.id)
        .set(product.toMap());
  }

  Future<void> deleteProductData(Product product) async {
    return await _db.collection("products").doc(product.id).delete();
  }

  Future<List<Product>> getAllProductData() async {
    var snapshot = await _db.collection("products").get();
    return snapshot.docs
        .map((doc) => Product.fromDocumentSnapshot(doc))
        .toList();
  }
}
