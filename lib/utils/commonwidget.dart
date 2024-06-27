import 'package:flutter/material.dart';

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
