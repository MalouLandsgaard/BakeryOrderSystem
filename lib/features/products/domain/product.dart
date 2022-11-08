import 'package:bakery_order_system/features/orders/domain/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String description;
  double price;
  Category category;
  String? path;
  bool active;

  Product(
    this.id, {
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.active,
    this.path,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'active': active,
      'path': path ?? "",
    };
  }

  Product.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!["name"],
        description = doc.data()!["description"],
        price = doc.data()!["price"],
        category = doc.data()!["category"],
        active = doc.data()!["active"],
        path = doc.data()!["path"];
}