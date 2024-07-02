// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solulab2/utils/commonwidget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                children: [
                  SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: assign2TextField(
                          text: "Find Your\nFavorite Food",
                          fontFamily: 'Bentonsans_Bold',
                          fontSize: 31.0,
                          color: Color(0xFF22242E),
                        ),
                      ),
                      SizedBox(width: 27.0),
                      notificationBell(),
                    ],
                  ),
                  SizedBox(height: 18.0),
                  Row(
                    children: [
                      Expanded(child: searchBox()),
                      SizedBox(width: 9.0),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 20,
                    child: assign2TextField(
                      text: 'Type',
                      fontFamily: 'Bentonsans_Bold',
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Wrap(
                    clipBehavior: Clip.none,
                    spacing: 20,
                    children: const [
                      CustomChip(text: 'Restaurant'),
                      CustomChip(text: 'Menu'),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 20,
                    child: assign2TextField(
                      text: 'Location',
                      fontFamily: 'Bentonsans_Bold',
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Wrap(
                    clipBehavior: Clip.none,
                    spacing: 20,
                    children: const [
                      CustomChip(text: '1 Km'),
                      CustomChip(text: '>10 Km'),
                      CustomChip(text: '<10 Km')
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 20,
                    child: assign2TextField(
                      text: 'Food',
                      fontFamily: 'Bentonsans_Bold',
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Wrap(
                    clipBehavior: Clip.none,
                    spacing: 20,
                    runSpacing: 20,
                    children: const [
                      CustomChip(text: 'Cake'),
                      CustomChip(text: 'Soup'),
                      CustomChip(text: 'Main Course'),
                      CustomChip(text: 'Appetizer'),
                      CustomChip(text: 'Dessert'),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B50F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fixedSize: const Size(157, 57)),
                  onPressed: () {},
                  child: const Center(
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontFamily: 'BentonSans_Bold',
                        fontSize: 14,
                        color: Color(0xffFEFEFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
