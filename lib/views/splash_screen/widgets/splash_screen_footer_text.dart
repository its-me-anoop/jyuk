//Designed and developed by Flutterly Ltd.
//
//
//This widget is used to display the app name at the footer of the splash screen
import 'package:flutter/material.dart';
import 'package:jyuk/constants/app_texts.dart';

class SplashScreenFooterText extends StatelessWidget {
  const SplashScreenFooterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Text(
          appName, //Get the app name from the constants repository
          style: const TextStyle(
              color: Colors.white,
              fontSize: 12), //todo: Move this to a constant text style file
        ),
      ),
    );
  }
}
