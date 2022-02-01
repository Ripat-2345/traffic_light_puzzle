import 'package:get/get.dart';

class GameController extends GetxController {
  Map<int, RxList> box = {
    1: [0, 0, 0].obs,
    2: [1, 2, 3].obs,
    3: [1, 2, 3].obs,
  };

  void countLamp() {
    for (var i = 0; i < box[1]!.length; i++) {
      if (box[1]![i] == 0) {
        box[1]![i] = i + 1;
      }
    }
  }
}
