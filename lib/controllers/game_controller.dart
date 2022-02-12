import 'dart:math';

import 'package:get/get.dart';

class GameController extends GetxController {
  Map<int, RxList> lamp = {
    1: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    2: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    3: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    4: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    5: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    6: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    7: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    8: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    9: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    10: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    11: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    12: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    13: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    14: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    15: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    16: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    17: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    18: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    19: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
    20: [
      1,
      ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
      ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
    ].obs,
  };

  void countLamp(int index) {
    for (var i = 0; i < lamp[index]!.length; i++) {
      if (lamp[index]![i] == 0) {
        lamp[index]![i] = i + 1;
        break;
      } else if ((lamp[index]![0] == 1) &&
          (lamp[index]![1] == 2) &&
          (lamp[index]![2] == 3)) {
        lamp[index]![0] = 1;
        lamp[index]![1] = 0;
        lamp[index]![2] = 0;
        break;
      }
    }
  }
}
