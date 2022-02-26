import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jyuk/home_screen/controllers/home_screen_controller.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController _page = Get.put(HomeScreenController());

    return Obx(() => CupertinoTabBar(
            onTap: (index) {
              _page.selectNewPage(index);
              _page.homePageController.value.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            currentIndex: _page.currentPage.value,
            backgroundColor: Colors.transparent,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.event_outlined),
                  label: "Events",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined),
                  label: "Prayer Groups",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books_outlined),
                  label: "Resources",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_outlined),
                  label: "About Us",
                  backgroundColor: Colors.transparent)
            ]));
  }
}
