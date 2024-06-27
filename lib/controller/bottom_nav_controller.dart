import 'package:get/get.dart';
import 'package:solulab2/navigation%20screens/cart.dart';
import 'package:solulab2/navigation%20screens/homepage.dart';
import 'package:solulab2/navigation%20screens/notification.dart';
import 'package:solulab2/navigation%20screens/profile.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;


  var pages = [
    const Homepage(),
    const Profile(),
    const Cart(),
    const Notification(),
  ].obs;
}