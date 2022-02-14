import 'dart:math';

import 'package:get/get.dart';

class GameController extends GetxController {
  RxList lamp = [].obs;

  void getLamp(int count) {
    for (var i = 0; i < count; i++) {
      lamp.add([
        1,
        ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
        ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
      ].obs);
    }
  }

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
