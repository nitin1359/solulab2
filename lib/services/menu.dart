import 'package:cloud_firestore/cloud_firestore.dart';

class Menu {
  final String name;
  final String imageUrl;
  final String restaurant;
  final int price;

  Menu({
    required this.name,
    required this.imageUrl,
    required this.restaurant,
    required this.price,
  });

  factory Menu.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Menu(
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      restaurant: data['restaurant'] ?? '',
      price: data['price'] ?? 0,
    );
  }
}
