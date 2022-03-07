import 'package:flutter/material.dart';
import 'package:flutter_game/controllers/home_controller.dart';
import 'package:flutter_game/screens/widgets/car_color_widget.dart';
import 'package:flutter_game/const.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:html' as html;

import '../controllers/music_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  final musicController = Get.find<MusicController>();

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Traffic Light Puzzle",
      color: whiteColor,
      child: Scaffold(
        backgroundColor: yellowColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Traffic Light Puzzle",
              style: TextStyle(
                color: darkColor,
                fontSize: (MediaQuery.of(context).size.width < 800) ? 30 : 80,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Obx(
              () => Lottie.asset(
                "assets/images/${homeController.fileCar}",
                height: (MediaQuery.of(context).size.width < 800) ? 200 : 300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < homeController.colors.length; i++)
                  InkWell(
                    onTap: () =>
                        homeController.changeCarColor(homeController.colors[i]),
                    child: CarColor(
                      color: homeController.colors[i],
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Get.toNamed(
                    "/Game",
                    arguments: [
                      homeController.selectedLevel.value,
                      homeController.fileCar
                    ],
                  ),
                  child: Container(
                    height: 40,
                    width: 130,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    child: Text(
                      "Start",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize:
                            (MediaQuery.of(context).size.width < 800) ? 20 : 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 17,
            ),
            SizedBox(
              width: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => homeController.dialogPlay(context),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            size: 30,
                            color: darkColor,
                          ),
                          const Text("Info"),
                        ],
                      )),
                  InkWell(
                      onTap: () => html.window.open(
                          "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
                          "Demo Game"),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_circle_fill,
                            size: 30,
                            color: darkColor,
                          ),
                          const Text("Demo"),
                        ],
                      )),
                  InkWell(
                    onTap: () => Get.toNamed('/FeedBack'),
                    child: Row(
                      children: [
                        Icon(
                          Icons.rate_review_rounded,
                          size: 30,
                          color: darkColor,
                        ),
                        const Text("Rate")
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => musicController.musicPlay(),
                    child: Row(
                      children: [
                        Obx(
                          () => (musicController.isPlay.value)
                              ? Icon(
                                  Icons.volume_off_rounded,
                                  size: 31,
                                  color: darkColor,
                                )
                              : Icon(
                                  Icons.volume_up_rounded,
                                  size: 31,
                                  color: darkColor,
                                ),
                        ),
                        const Text("Music")
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
          ],
        ),
      ),
    );
  }
}
