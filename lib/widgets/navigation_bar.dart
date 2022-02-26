import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(backgroundColor: Colors.transparent, items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.home), backgroundColor: Colors.transparent),
      BottomNavigationBarItem(
          icon: Icon(Icons.home), backgroundColor: Colors.transparent),
      BottomNavigationBarItem(
          icon: Icon(Icons.home), backgroundColor: Colors.transparent)
    ]);
  }
}
