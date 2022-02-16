import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selected = "".obs;

  List<String> levels = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"];

  List<Color> color = [
    Colors.deepPurpleAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.redAccent
  ];

  void changeCarColor(Color colorChoose) {}
}
  