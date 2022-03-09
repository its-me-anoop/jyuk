import 'package:flutter/material.dart';
import 'package:jyuk/constants/app_texts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import '../constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          minRadius: value * 3,
                          repeat: false,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 1500),
                            height: value * 2,
                            width: value * 2,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: red,
                                border: Border.all(color: white, width: 10.0)),
                            child: Center(
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 1000),
                                height: value * 1.2,
                                width: value * 1.2,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: blue,
                                    border:
                                        Border.all(color: white, width: 10.0)),
                                child: Center(
                                  child: SizedBox(
                                      child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: value / 3,
                                    width: value / 3,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: white,
                                        border: Border.all(
                                            color: white, width: 10.0)),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //App Name goes here
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Shimmer.fromColors(
                            highlightColor: Colors.grey,
                            baseColor: white,
                            child: Text(
                              appName,
                              style: TextStyle(
                                  color: Colors.white, fontSize: value / 5),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: Text(
                    ownerName,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
