// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solulab2/detail%20screen/explore_restaurant.dart';
import 'package:solulab2/utils/commonwidget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/promo_advertising.png'),
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          child: assign2TextField(
                              text: 'Nearest Restaurant',
                              fontFamily: 'Bentonsans_Bold',
                              fontSize: 15.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ExploreRestaurant());
                          },
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Color(0xFF6B50F6),
                                fontFamily: 'Bentonsans_Book',
                                fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    nearestRestaurant(),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          child: assign2TextField(
                              text: 'Popular Menu',
                              fontFamily: 'Bentonsans_Bold',
                              fontSize: 15.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ExploreRestaurant());
                          },
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Color(0xFF6B50F6),
                                fontFamily: 'Bentonsans_Book',
                                fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    popularMenu(),
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
