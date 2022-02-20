import 'dart:async';
import 'dart:math';
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_game/const.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class GameController extends GetxController {
  final _argument = Get.arguments;
  late CountdownTimerController timeController;
  late int remainingTime;
  late Timer finish;
  var trafficLamp = 0.obs;
  var carMove = false.obs;
  var absorbing = false.obs;
  Map<int, RxList> lamp = {};
  Map<int, RxList> lampFinish = {};

  @override
  void onInit() {
    super.onInit();
    remainingTime = DateTime.now().millisecondsSinceEpoch + 1000 * 90;
    timeController = CountdownTimerController(
      endTime: remainingTime,
      onEnd: onTimeEnded,
    );
    (remainingTime == 0) ? onTimeEnded() : null;

    print(_argument);
    selectedLevel(_argument[0]);
  }

  @override
  void dispose() {
    super.dispose();
    timeController.dispose();
  }

  get argument => _argument;

  void getLamp(int count) {
    for (var i = 1; i <= count; i++) {
      lamp[i] = [
        1,
        ((Random().nextInt(2) + 1) == 2) ? 2 : 0,
        ((Random().nextInt(3) + 2) == 3) ? 3 : 0,
      ].obs;
    }

    for (var i = 1; i <= count; i++) {
      lampFinish[i] = [
        1,
        2,
        3,
      ].obs;
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

  void selectedLevel(String level) {
    getLamp(
      (level == "Level 1")
          ? trafficLamp.value = 11
          : (level == "Level 2")
              ? trafficLamp.value = 15
              : (level == "Level 3")
                  ? trafficLamp.value = 19
                  : (level == "Level 4")
                      ? trafficLamp.value = 23
                      : (level == "Level 5")
                          ? trafficLamp.value = 27
                          : trafficLamp.value = 0,
    );
  }

  void onTimeEnded() {
    Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: whiteColor,
      title: "Time Is Over",
      titleStyle: TextStyle(color: darkColor, fontSize: 20),
      content: Lottie.asset(
        "assets/images/clock.json",
        width: 300,
        fit: BoxFit.cover,
      ),
      contentPadding: const EdgeInsets.all(10),
      textConfirm: "Restart",
      confirmTextColor: darkColor,
      onConfirm: () => Get.offAllNamed(
        "/Game",
        arguments: [_argument[0], _argument[1]],
      ),
      textCancel: "Back",
      cancelTextColor: darkColor,
      onCancel: () => Get.offAllNamed('/Home'),
      buttonColor: yellowColor,
    );
  }

  void gameFinish() {
    var levelNow = _argument[0].split('');
    var changeLevel = int.parse(levelNow.last) + 1;
    levelNow.last = changeLevel.toString();

    if (changeLevel == 6) {
      absorbing.toggle();
      carMove.toggle();
      Future.delayed(const Duration(seconds: 2), () {
        Get.defaultDialog(
          barrierDismissible: false,
          backgroundColor: whiteColor,
          title: "Congratulations",
          titleStyle: TextStyle(color: darkColor, fontSize: 20),
          content: Lottie.asset(
            "assets/images/success.json",
            width: 300,
            fit: BoxFit.cover,
          ),
          contentPadding: const EdgeInsets.all(10),
          textCancel: "Back",
          cancelTextColor: darkColor,
          onCancel: () => Get.offAllNamed('/Home'),
          buttonColor: yellowColor,
        );
      });
    } else {
      absorbing.toggle();
      carMove.toggle();
      Future.delayed(const Duration(seconds: 2), () {
        Get.defaultDialog(
          barrierDismissible: false,
          backgroundColor: whiteColor,
          title: "Congratulations",
          titleStyle: TextStyle(color: darkColor, fontSize: 20),
          content: Lottie.asset(
            "assets/images/success.json",
            width: 300,
            fit: BoxFit.cover,
          ),
          contentPadding: const EdgeInsets.all(10),
          textConfirm: "Next Level",
          confirmTextColor: darkColor,
          onConfirm: () => Get.offAllNamed(
            "/Game",
            arguments: [levelNow.join(""), _argument[1]],
          ),
          textCancel: "Back",
          cancelTextColor: darkColor,
          onCancel: () => Get.offAllNamed('/Home'),
          buttonColor: yellowColor,
        );
      });
    }
  }
}
