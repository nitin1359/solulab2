// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solulab2/services/restaurant.dart';
import 'package:solulab2/utils/bottomnavbar.dart';
import 'package:solulab2/utils/commonwidget.dart';

class ExploreRestaurant extends StatelessWidget {
  const ExploreRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // const BgImage(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: assign2TextField(
                            text: "Find Your\nFavorite Food",
                            fontFamily: 'Bentonsans_Bold',
                            fontSize: 31.0,
                            color: const Color(0xFF22242E),
                          ),
                        ),
                        const SizedBox(width: 27.0),
                        notificationBell(),
                      ],
                    ),
                    SizedBox(height: 18.0),
                    Row(
                      children: [
                        searchBox(),
                        SizedBox(
                          width: 9.0,
                        ),
                        filterButton(),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      height: 20,
                      child: assign2TextField(
                          text: 'Popular Restaurant',
                          fontFamily: 'Bentonsans_Bold',
                          fontSize: 15.0),
                    ),
                    SizedBox(height: 20.0),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('restaurants')
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }

                          List<Restaurant> restaurants =
                              snapshot.data!.docs.map(
                            (doc) {
                              return Restaurant.fromFirestore(doc);
                            },
                          ).toList();
                          return popularRestaurant(list: restaurants);
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
