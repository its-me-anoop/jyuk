import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jyuk/constants/app_texts.dart';
import 'package:jyuk/views/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ConnectionNotifier(
    child: GetMaterialApp(
      title: appNameShort,
      initialRoute: '/',
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(
            name: '/',
            page: () => const SplashScreen(),
            transition: Transition.zoom),
      ],
    ),
  ));
}
