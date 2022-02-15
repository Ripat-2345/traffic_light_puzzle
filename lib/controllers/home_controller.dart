import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selected = "".obs;

  List<String> levels = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"];

  List color = [
    Colors.red[900],
    Colors.greenAccent,
    Colors.white,
    Colors.black,
  ];

  var fileCar = "car.json".obs;

  List cars = [
    "red_car.json",
    "green_car.json",
    "white_car.json",
    "black_car.json",
  ];

  void changeCarColor(Color colorChoose) {
    for (var i = 0; i < color.length; i++) {
      if (colorChoose == color[i]) {
        fileCar.value = cars[i];
        break;
      }
    }
  }
}
