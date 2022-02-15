import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_game/const.dart';
import 'package:flutter_game/controllers/game_controller.dart';
import 'package:flutter_game/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final gameController = Get.put(GameController());
  final argument = Get.arguments;
  late CountdownTimerController timeController;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  void onEnd() {
    Get.defaultDialog(
      backgroundColor: whiteColor,
      title: "Time Is Over",
      titleStyle: TextStyle(color: darkColor, fontSize: 20),
      content: Lottie.asset("assets/images/clock.json",
          width: 300, fit: BoxFit.cover),
      contentPadding: const EdgeInsets.all(10),
      textConfirm: "Restart",
      confirmTextColor: darkColor,
      onConfirm: () => Get.offAll(const GameScreen()),
      textCancel: "Back",
      cancelTextColor: darkColor,
      onCancel: () => Get.offAllNamed('/Home'),
      buttonColor: yellowColor,
    );
  }

  @override
  void initState() {
    super.initState();
    gameController.getLamp(
      (argument[0] == "Level 1")
          ? gameController.trafficLamp.value = 11
          : (argument[0] == "Level 2")
              ? gameController.trafficLamp.value = 15
              : (argument[0] == "Level 3")
                  ? gameController.trafficLamp.value = 19
                  : (argument[0] == "Level 4")
                      ? gameController.trafficLamp.value = 23
                      : (argument[0] == "Level 5")
                          ? gameController.trafficLamp.value = 27
                          : gameController.trafficLamp.value = 0,
    );
    timeController = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    if (endTime == 0) {
      onEnd();
    }
  }

  @override
  void dispose() {
    super.dispose();
    timeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: darkColor,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Time: ",
                        style: TextStyle(
                          fontSize: 24,
                          color: yellowColor,
                        ),
                      ),
                      CountdownTimer(
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: yellowColor,
                        ),
                        controller: timeController,
                        onEnd: onEnd,
                        endTime: endTime,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left:
                          (MediaQuery.of(context).size.width < 800) ? 10 : 300,
                      right:
                          (MediaQuery.of(context).size.width < 800) ? 10 : 300,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(
                        color: yellowColor,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        for (var i = 1;
                            i <= gameController.trafficLamp.value;
                            i++)
                          InkWell(
                            onTap: () {
                              gameController.countLamp(i);
                              gameController.countLamp(
                                  (i == gameController.trafficLamp.value)
                                      ? 1
                                      : i + 1);
                              print([
                                i,
                                (i == gameController.trafficLamp.value)
                                    ? 1
                                    : i + 1
                              ]);
                            },
                            child: Container(
                              width: (MediaQuery.of(context).size.width < 800)
                                  ? 70
                                  : 120,
                              height: (MediaQuery.of(context).size.width < 800)
                                  ? 35
                                  : 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: darkColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Obx(
                                    () => Container(
                                      width:
                                          (MediaQuery.of(context).size.width <
                                                  800)
                                              ? 15
                                              : 30,
                                      height:
                                          (MediaQuery.of(context).size.width <
                                                  800)
                                              ? 15
                                              : 30,
                                      decoration: BoxDecoration(
                                        color: (gameController.lamp[i]![0] != 0)
                                            ? Colors.green
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Container(
                                      width:
                                          (MediaQuery.of(context).size.width <
                                                  800)
                                              ? 15
                                              : 30,
                                      height:
                                          (MediaQuery.of(context).size.width <
                                                  800)
                                              ? 15
                                              : 30,
                                      decoration: BoxDecoration(
                                        color: (gameController.lamp[i]![1] != 0)
                                            ? Colors.green
                                            : Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Container(
                                      width:
                                          (MediaQuery.of(context).size.width <
                                                  800)
                                              ? 15
                                              : 30,
                                      height:
                                          (MediaQuery.of(context).size.width <
                                                  800)
                                              ? 15
                                              : 30,
                                      decoration: BoxDecoration(
                                        color: (gameController.lamp[i]![2] != 0)
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width:
                          (MediaQuery.of(context).size.width < 800) ? 200 : 300,
                      height:
                          (MediaQuery.of(context).size.width < 800) ? 120 : 180,
                      child: (argument[1] == null)
                          ? Lottie.asset(
                              "assets/images/car.json",
                              fit: BoxFit.cover,
                            )
                          : Lottie.asset(
                              "assets/images/${argument[1]}",
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
