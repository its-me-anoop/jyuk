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
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.transparent,
                    Theme.of(context).dividerColor,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                )),
            child,
          ],
        ));
  }
}
