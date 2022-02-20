import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedLevel = "Pilih Level".obs;

  List<String> levels = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"];

  List colors = const [
    Color(0XFF1A1A1A),
    Color(0XFF4a90e2),
    Color(0XFF4c7a46),
    Color(0XFF870808),
    Color(0XFFf5f5f5),
  ];

  var fileCar = "1a1a1a.json".obs;

  List cars = [
    "1a1a1a.json",
    "4a90e2.json",
    "4c7a46.json",
    "870808.json",
    "f5f5f5.json",
  ];

  void changeCarColor(Color colorChoose) {
    for (var i = 0; i < colors.length; i++) {
      if (colorChoose == colors[i]) {
        fileCar.value = cars[i];
        break;
      }
    }
  }
}
