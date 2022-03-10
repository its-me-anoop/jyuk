//Designed and developed by Flutterly Ltd.
//
//
//This is the Splash / Entry screen of the application
//
//This screen is used to perform the following operations before taking the users to the main view of the app
//1. Check internet connectivity
//2. Check whether the user is authenticated
//3. Fetch and preload the home screen contents from the database

import 'package:flutter/material.dart';
import 'package:jyuk/constants/app_colors.dart';
import 'package:jyuk/views/splash_screen/widgets/splash_screen_footer_text.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get device height and width using MediaQuery.
    //These values can be used later in the screen to make the app more responsive and adapt to various screen sizes
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          color: blue,
          height: deviceHeight,
          width: deviceWidth,
          child: Stack(
            children: [
              Center(
                child: TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  tween: Tween<double>(begin: 0, end: deviceWidth / 3),
                  builder: (context, double value, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //App logo goes here
                        RippleAnimation(
                          color: white,
                          minRadius: value,
                          repeat: true,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 1500),
                            height: value,
                            width: value,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/icon/jy_white.png')),
                                color: blue,
                                border: Border.all(color: white, width: 10.0)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SplashScreenFooterText()
            ],
          )),
    );
  }
}
