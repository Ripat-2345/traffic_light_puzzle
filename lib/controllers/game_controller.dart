import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_game/const.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_game/controllers/home_controller.dart';

class GameController extends GetxController {
  final homeController = Get.put(HomeController());
  final _argument = Get.arguments;
  late CountdownTimerController timeController = CountdownTimerController(
    endTime: remainingTime.value,
    onEnd: onTimeEnded,
  );
  late RxInt remainingTime =
      (DateTime.now().millisecondsSinceEpoch + 1000 * 90).obs;
  late Timer finish;
  var trafficLamp = 0.obs;
  var carMove = false.obs;
  var absorbing = false.obs;
  Map<int, RxList> lamp = {};
  Map<int, RxList> lampFinish = {};

  @override
  void onInit() {
    super.onInit();
    if (_argument == null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        timeController.dispose();
        Get.offAllNamed("/Home");
      });
    } else {
      selectedLevel(_argument[0]);
      (remainingTime.value == 0) ? onTimeEnded() : null;
      if (_argument[0] == "Level 1") {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          timeController.disposeTimer();
          return guideDialog();
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    timeController.dispose();
  }

  Future<bool> onWillPop() {
    Get.offAllNamed("/Home");
    timeController.dispose();
    return Future(() => true);
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
          ? trafficLamp.value = 21
          : (level == "Level 2")
              ? trafficLamp.value = 25
              : (level == "Level 3")
                  ? trafficLamp.value = 31
                  : (level == "Level 4")
                      ? trafficLamp.value = 35
                      : (level == "Level 5")
                          ? trafficLamp.value = 40
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
      onConfirm: () {
        Get.offAllNamed(
          "/Game",
          arguments: [_argument[0], _argument[1]],
        );
        timeController.dispose();
      },
      textCancel: "Back To Home",
      cancelTextColor: darkColor,
      onCancel: () {
        Get.offAllNamed('/Home');
        timeController.dispose();
      },
      buttonColor: yellowColor,
    );
  }

  void gameFinish() {
    var levelNow = _argument[0].split('');
    var changeLevel = int.parse(levelNow.last) + 1;
    levelNow.last = changeLevel.toString();

    if (changeLevel == 6) {
      timeController.disposeTimer();
      absorbing.toggle();
      carMove.toggle();
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Get.defaultDialog(
            barrierDismissible: false,
            backgroundColor: whiteColor,
            title: "${_argument[0]} Finish",
            titleStyle: TextStyle(color: darkColor, fontSize: 20),
            content: Lottie.asset(
              "assets/images/success.json",
              width: 300,
              fit: BoxFit.cover,
            ),
            contentPadding: const EdgeInsets.all(10),
            textConfirm: "Send Your Feedback",
            confirmTextColor: darkColor,
            onConfirm: () {
              Get.offAllNamed(
                "/FeedBack",
              );
              timeController.dispose();
            },
            textCancel: "Back To Home",
            cancelTextColor: darkColor,
            onCancel: () => Get.offAllNamed('/Home'),
            buttonColor: yellowColor,
          );
        },
      );
    } else {
      timeController.disposeTimer();
      absorbing.toggle();
      carMove.toggle();
      Future.delayed(const Duration(seconds: 2), () {
        Get.defaultDialog(
          barrierDismissible: false,
          backgroundColor: whiteColor,
          title: "${_argument[0]} Finish",
          titleStyle: TextStyle(color: darkColor, fontSize: 20),
          content: Lottie.asset(
            "assets/images/success.json",
            width: 300,
            fit: BoxFit.cover,
          ),
          contentPadding: const EdgeInsets.all(10),
          textConfirm: "Next Level",
          confirmTextColor: darkColor,
          onConfirm: () {
            Get.offAllNamed(
              "/Game",
              arguments: [levelNow.join(""), _argument[1]],
            );
            timeController.dispose();
          },
          textCancel: "Back To Home",
          cancelTextColor: darkColor,
          onCancel: () {
            Get.offAllNamed('/Home');
            timeController.dispose();
          },
          buttonColor: yellowColor,
        );
      });
    }
  }

  void guideDialog() {
    Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: whiteColor,
      title: "Objective",
      titleStyle: TextStyle(
        fontSize: 20,
        color: darkColor,
      ),
      contentPadding: const EdgeInsets.all(2),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image(
          image: const AssetImage("assets/images/howtoplay5.png"),
          width: (Get.width < 800) ? Get.width / 1.5 : Get.width / 2,
          height: (Get.width < 800) ? Get.height / 4 : Get.height / 2,
          fit: BoxFit.fill,
        ),
      ),
      textConfirm: "OK",
      confirmTextColor: darkColor,
      onConfirm: () {
        timeController.start();
        Get.back();
      },
      buttonColor: yellowColor,
    );
  }
}
