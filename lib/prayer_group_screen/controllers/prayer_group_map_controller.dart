import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayerGroupMapController extends GetxController {
  var currentLocationIndex = 0.obs;

  var prayerGroupPage = PageController().obs;

  updateLocationIndex(index) => currentLocationIndex(index);
}
