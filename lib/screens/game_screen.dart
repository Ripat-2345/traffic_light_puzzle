import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game/controllers/game_controller.dart';
import 'package:get/get.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final gameController = Get.put(GameController());
  List numBox = [1, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      gameController.countLamp(1);
                      gameController.countLamp(4);
                      print(gameController.lamp[1]);
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: (gameController.lamp[1]![0] != 0)
                                    ? Colors.red
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: (gameController.lamp[1]![1] != 0)
                                        ? Colors.amber
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: (gameController.lamp[1]![2] != 0)
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      gameController.countLamp(1);
                      gameController.countLamp(2);
                      print(gameController.lamp[2]);
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: (gameController.lamp[2]![0] != 0)
                                    ? Colors.red
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: (gameController.lamp[2]![1] != 0)
                                        ? Colors.amber
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: (gameController.lamp[2]![2] != 0)
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      gameController.countLamp(2);
                      gameController.countLamp(3);
                      print(gameController.lamp[3]);
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: (gameController.lamp[3]![0] != 0)
                                    ? Colors.red
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: (gameController.lamp[3]![1] != 0)
                                        ? Colors.amber
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: (gameController.lamp[3]![2] != 0)
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      gameController.countLamp(3);
                      gameController.countLamp(4);
                      print(gameController.lamp[4]);
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: (gameController.lamp[4]![0] != 0)
                                    ? Colors.red
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: (gameController.lamp[4]![1] != 0)
                                        ? Colors.amber
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Obx(
                                () => Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: (gameController.lamp[4]![2] != 0)
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
