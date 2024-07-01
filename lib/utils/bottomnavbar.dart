import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:solulab2/controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      body: Obx(
        () => controller.pages[controller.currentIndex.value],
      ),
      bottomNavigationBar: SizedBox(
        height: 75.0,
        width: double.infinity,
        child: GNav(
          onTabChange: (value) {
            controller.currentIndex.value = value;
          },
          backgroundColor: const Color(0xffFFFFFF),
          rippleColor: Colors.grey, // tab button ripple color when pressed
          hoverColor: Colors.grey, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 12,
          curve: Curves.easeOutExpo, // tab animation curves
          duration: const Duration(milliseconds: 200), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: const Color(0xff6B50F6), // unselected icon color
          activeColor: const Color(0xff6B50F6), // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: const Color(0xff6B50F6)
              .withOpacity(0.1), // selected tab background color
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          tabMargin: const EdgeInsets.symmetric(
              horizontal: 10.0), // navigation bar padding
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
              textStyle:
                  TextStyle(fontFamily: 'Bentonsans_Medium', fontSize: 12.0),
            ),
            GButton(
              icon: Icons.person,
              text: 'Likes',
              textStyle:
                  TextStyle(fontFamily: 'Bentonsans_Medium', fontSize: 12.0),
            ),
            GButton(
              icon: Icons.shopping_basket,
              text: 'Search',
              textStyle:
                  TextStyle(fontFamily: 'Bentonsans_Medium', fontSize: 12.0),
            ),
            GButton(
              icon: Icons.message,
              text: 'Profile',
              textStyle:
                  TextStyle(fontFamily: 'Bentonsans_Medium', fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
