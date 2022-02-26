import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jyuk/constants/dark_theme.dart';
import 'package:jyuk/constants/light_theme.dart';
import 'package:jyuk/home_screen/views/home_view.dart';

void main() => runApp(GetMaterialApp(
      title: 'JYUK',
      initialRoute: '/',
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,
      getPages: [
        GetPage(
            name: '/', page: () => const Home(), transition: Transition.zoom),
      ],
    ));

class MainPages extends StatelessWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
