import 'package:cloud_firestore/cloud_firestore.dart';

class PopularMenu {
  final String name;
  final String imageUrl;
  final String restaurant;
  final int price;

  PopularMenu({
    required this.name,
    required this.imageUrl,
    required this.restaurant,
    required this.price,
  });

  factory PopularMenu.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return PopularMenu(
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      restaurant: data['restaurant'] ?? '',
      price: data['price'] ?? 0,
    );
  }
}
