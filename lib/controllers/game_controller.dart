import 'package:get/get.dart';

class GameController extends GetxController {
  RxMap box = {
    1: [0, 2, 3],
    2: [1, 2, 3],
    3: [1, 2, 3],
  }.obs;
}
