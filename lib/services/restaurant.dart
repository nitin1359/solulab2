import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  final String name;
  final String imageUrl;
  final int deliveryTime;

  Restaurant({
    required this.name,
    required this.imageUrl,
    required this.deliveryTime,
  });

  factory Restaurant.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Restaurant(
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      deliveryTime: data['deliveryTime'] ?? 0,
    );
  }
}
