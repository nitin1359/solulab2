import 'package:get/get.dart';
import 'package:solulab2/cart.dart';
import 'package:solulab2/homepage.dart';
import 'package:solulab2/notification.dart';
import 'package:solulab2/profile.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;


  var pages = [
    const Homepage(),
    const Profile(),
    const Cart(),
    const Notification(),
  ].obs;
}