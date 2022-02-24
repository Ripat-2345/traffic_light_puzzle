import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_game/const.dart';
import 'package:flutter_game/controllers/game_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final gameController = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Traffic Light Puzzle",
      color: whiteColor,
      child: WillPopScope(
        onWillPop: () => gameController.onWillPop(),
        child: Scaffold(
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
                          Container(
                            width: 150,
                            height: 60,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: whiteColor.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer_rounded,
                                  color: yellowColor,
                                  size: 40,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                CountdownTimer(
                                  endTime: gameController.remainingTime,
                                  controller: gameController.timeController,
                                  widgetBuilder: (_, time) {
                                    if (time == null) {
                                      return Text(
                                        "0 : 00",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: yellowColor,
                                        ),
                                      );
                                    }
                                    return Text(
                                      "${(time.min == null) ? "0" : time.min} : ${(time.sec == null) ? "0" : time.sec}",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: yellowColor,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: (MediaQuery.of(context).size.width < 800)
                              ? 10
                              : 300,
                          right: (MediaQuery.of(context).size.width < 800)
                              ? 10
                              : 300,
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
                              Obx(
                                () => AbsorbPointer(
                                  absorbing: gameController.absorbing.value,
                                  child: InkWell(
                                    onTap: () {
                                      gameController.countLamp(i);
                                      gameController.countLamp((i ==
                                              gameController.trafficLamp.value)
                                          ? 1
                                          : i + 1);
                                      (const DeepCollectionEquality().equals(
                                              gameController.lamp,
                                              gameController.lampFinish))
                                          ? gameController.gameFinish()
                                          : null;
                                    },
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width <
                                                  800)
                                              ? 70
                                              : 120,
                                      height:
                                          (MediaQuery.of(context).size.width <
                                                  800)
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
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      800)
                                                  ? 15
                                                  : 30,
                                              height: (MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      800)
                                                  ? 15
                                                  : 30,
                                              decoration: BoxDecoration(
                                                color: (gameController
                                                            .lamp[i]![0] !=
                                                        0)
                                                    ? Colors.green
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                          ),
                                          Obx(
                                            () => Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      800)
                                                  ? 15
                                                  : 30,
                                              height: (MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      800)
                                                  ? 15
                                                  : 30,
                                              decoration: BoxDecoration(
                                                color: (gameController
                                                            .lamp[i]![1] !=
                                                        0)
                                                    ? Colors.green
                                                    : Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                          ),
                                          Obx(
                                            () => Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      800)
                                                  ? 15
                                                  : 30,
                                              height: (MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      800)
                                                  ? 15
                                                  : 30,
                                              decoration: BoxDecoration(
                                                color: (gameController
                                                            .lamp[i]![2] !=
                                                        0)
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
                      Obx(() => AnimatedAlign(
                            duration: const Duration(seconds: 2),
                            alignment: gameController.carMove.value
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width < 800)
                                  ? 200
                                  : 300,
                              height: (MediaQuery.of(context).size.width < 800)
                                  ? 120
                                  : 180,
                              child: (gameController.argument == null)
                                  ? Lottie.asset(
                                      "assets/images/car.json",
                                      fit: BoxFit.cover,
                                    )
                                  : Lottie.asset(
                                      "assets/images/${gameController.argument[1]}",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, bottom: 20, right: 20),
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
        ),
      ),
    );
  }
}
