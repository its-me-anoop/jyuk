import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: Colors.white,
        textTheme: CupertinoTextThemeData(primaryColor: Colors.white)));
