import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solulab2/detail%20screen/filter_screen.dart';
import 'package:solulab2/services/menu.dart';
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
      onPressed: () {
        Get.to(() => const FilterScreen());
      },
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data?.size ?? 0,
          itemBuilder: (context, index) {
            final restaurant = restaurants[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 147,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
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
                        color: Color(0xFF22242E),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

Widget popularRestaurant() {
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

      return GridView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: snapshot.data?.size ?? 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
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
                    color: Color(0xFF22242E),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget popularMenu() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('menus').snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      final List<Menu> menus = snapshot.data!.docs.map(
        (doc) {
          return Menu.fromFirestore(doc);
        },
      ).toList();

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menus.length,
        itemBuilder: (context, index) {
          final menu = menus[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(menu.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            menu.name,
                            style: const TextStyle(
                              fontFamily: 'Bentonsans_Bold',
                              fontSize: 16.0,
                              color: Color(0xFF22242E),
                            ),
                          ),
                          Text(
                            menu.restaurant,
                            style: const TextStyle(
                              fontFamily: 'Bentonsans_Book',
                              fontSize: 13.0,
                              color: Color(0xFFB6B7B7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      '\$${menu.price}',
                      style: const TextStyle(
                        fontFamily: 'Bentonsans_Bold',
                        fontSize: 16.0,
                        color: Color(0xFF6B50F6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
