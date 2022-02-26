import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jyuk/home_screen/controllers/home_screen_controller.dart';
import 'package:jyuk/home_screen/widgets/navigation_bar.dart';
import 'package:jyuk/landing_view/views/landing_view.dart';
import 'package:jyuk/prayer_group_screen/prayer_groups.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController _page = Get.put(HomeScreenController());
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _page.homePageController.value,
        children: [const LandingView(), PrayerGroupsView()],
      ),
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}
