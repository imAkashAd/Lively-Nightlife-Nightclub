import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/features/bottom_navigation_bar/controllers/user_bottom_navigation_bar_controller.dart';
import 'package:lively_nightlife_nightclub_party/features/bottom_navigation_bar/widgets/custom_user_bottom_navbar.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/home_view/view/user_home_view.dart';


class UserBottomNavigationView extends StatelessWidget {
  UserBottomNavigationView({super.key});

  final controller =
      Get.find<UserBottomNavbarController>();

  final pages = [
    UserHomeView(),
    const Center(child: Text('Discover')),
    const Center(child: Text('Location')),
    const Center(child: Text('Events')),
    const Center(child: Text('Messages')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => pages[
            controller.selectedIndex.value],
      ),

      bottomNavigationBar:
          const CustomUserBottomNavbar(),
    );
  }
}