import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jyuk/home_screen/views/home_view.dart';

void main() => runApp(GetMaterialApp(
      title: 'JYUK',
      initialRoute: '/',
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
