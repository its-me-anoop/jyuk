import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var currentPage = 0.obs;
  var homePageController = PageController().obs;
  selectNewPage(int index) => currentPage(index);
}
