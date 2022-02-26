import 'dart:ui';

import 'package:flutter/material.dart';

class SectionView extends StatelessWidget {
  const SectionView({Key? key, required this.child, required this.height})
      : super(key: key);

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey[50]!, Colors.grey[200]!],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                  ),
                )),
            child,
          ],
        ));
  }
}
