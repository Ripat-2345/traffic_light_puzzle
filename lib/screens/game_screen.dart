import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game/const.dart';
import 'package:flutter_game/controllers/game_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int data = 19;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "All Light Must Be Green Light \n Time: ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: darkColor),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width < 800) ? 10 : 300,
                    right: (MediaQuery.of(context).size.width < 800) ? 10 : 300,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: darkColor,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      for (var i = 1; i <= data; i++)
                        InkWell(
                          onTap: () {
                            controller.countLamp(i);
                            controller.countLamp((i == data) ? 1 : i + 1);
                            print([i, (i == data) ? 1 : i + 1]);

                            // controller
                            //     .countLamp(((data - i) == 0) ? data : data - i);
                            // controller.countLamp((i == data) ? 1 : i);
                            // print([
                            //   ((data - i) == 0) ? data : data - i,
                            //   (i == data) ? 1 : i
                            // ]);
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Obx(
                                  () => Container(
                                    width: (MediaQuery.of(context).size.width <
                                            800)
                                        ? 15
                                        : 30,
                                    height: (MediaQuery.of(context).size.width <
                                            800)
                                        ? 15
                                        : 30,
                                    decoration: BoxDecoration(
                                      color: (controller.lamp[i]![0] != 0)
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Container(
                                    width: (MediaQuery.of(context).size.width <
                                            800)
                                        ? 15
                                        : 30,
                                    height: (MediaQuery.of(context).size.width <
                                            800)
                                        ? 15
                                        : 30,
                                    decoration: BoxDecoration(
                                      color: (controller.lamp[i]![1] != 0)
                                          ? Colors.green
                                          : Colors.amber,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Container(
                                    width: (MediaQuery.of(context).size.width <
                                            800)
                                        ? 15
                                        : 30,
                                    height: (MediaQuery.of(context).size.width <
                                            800)
                                        ? 15
                                        : 30,
                                    decoration: BoxDecoration(
                                      color: (controller.lamp[i]![2] != 0)
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(100),
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
            alignment: Alignment.bottomRight,
            child: Container(
              width: (MediaQuery.of(context).size.width < 800) ? 200 : 300,
              height: (MediaQuery.of(context).size.width < 800) ? 120 : 180,
              child: Lottie.asset(
                "images/car.json",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
