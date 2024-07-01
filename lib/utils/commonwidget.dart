import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solulab2/services/restaurant.dart';

Widget assign2TextField({
  required String text,
  required String fontFamily,
  required double fontSize,
  Color? color,
}) {
  return SizedBox(
    width: 233.0,
    height: 82.0,
    child: Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
      ),
    ),
  );
}

Widget notificationBell() {
  return Container(
    width: 45.0,
    height: 45.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: IconButton(
      onPressed: () {},
      icon: Image.asset('assets/images/notification_icon.png'),
    ),
  );
}

Widget searchBox() {
  return Expanded(
    child: Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: const Color(0xffEEECFC),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Color(0xff6B50F6)),
          hintText: 'What do you want to order?',
          hintStyle: TextStyle(color: Color(0xffBBAEFB)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        ),
      ),
    ),
  );
}

Widget filterButton() {
  return Container(
    width: 50.0,
    height: 50.0,
    decoration: BoxDecoration(
      color: const Color(0xffEEECFC),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: IconButton(
      onPressed: () {},
      icon: Image.asset('assets/images/filter_icon.png'),
    ),
  );
}

Widget nearestRestaurant() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('restaurants').snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      final List<Restaurant> restaurants = snapshot.data!.docs.map(
        (doc) {
          return Restaurant.fromFirestore(doc);
        },
      ).toList();

      return SizedBox(
        height: 200,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data?.size ?? 0,
          //  snapshot.data?.size ?? 0, - this is also same
          // for all list length we can use restaurants.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20.0,
            childAspectRatio: 147 / 184,
          ),
          itemBuilder: (context, index) {
            final restaurant = restaurants[index];
            return Container(
              width: 147,
              height: 184,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontFamily: 'Bentonsans_Bold',
                      fontSize: 16.0,
                      color: Color(0xFF22242E),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${restaurant.deliveryTime} Mins',
                    style: const TextStyle(
                      fontFamily: 'Bentonsans_Book',
                      fontSize: 13.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
