// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solulab2/utils/commonwidget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

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
                      ],
                    ),
                    SizedBox(height: 20.0),
                    assign2TextField(
                        text: 'Type',
                        fontFamily: 'Bentonsans_Bold',
                        fontSize: 15.0),
                    SizedBox(height: 20.0),
                    Row(
                      children: const [
                        Chip(label: Text('Restaurant')),
                        SizedBox(width: 10),
                        Chip(label: Text('Menu')),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Location',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: const [
                        Chip(label: Text('1 Km')),
                        Chip(label: Text('>10 Km')),
                        Chip(label: Text('<10 Km')),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Food', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        Chip(label: Text('Cake')),
                        Chip(label: Text('Soup')),
                        Chip(label: Text('Main Course')),
                        Chip(label: Text('Appetizer')),
                        Chip(label: Text('Dessert')),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text('Search'),
                      ),
                    ),
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
