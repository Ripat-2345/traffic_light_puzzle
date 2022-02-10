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
    int data = 9;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: (Get.width / data),
                right: (Get.width / data),
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.spaceEvenly,
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
                        width: Get.width / 10,
                        height: Get.width / 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Obx(
                              () => Container(
                                width: Get.width / 35,
                                height: Get.width / 35,
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
                                width: Get.width / 35,
                                height: Get.width / 35,
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
                                width: Get.width / 35,
                                height: Get.width / 35,
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
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Lottie.asset("images/car.json", height: 300),
          )
        ],
      ),
    );
  }
}
