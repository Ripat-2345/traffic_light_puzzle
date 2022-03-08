import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/const.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

class HomeController extends GetxController {
  late final CarouselController carouselController;
  var selectedLevel = "Level 1".obs;
  var currentImg = 0.obs;

  @override
  void onInit() {
    super.onInit();
    carouselController = CarouselController();
  }

  List colors = const [
    Color(0XFF1A1A1A),
    Color(0XFF4a90e2),
    Color(0XFF4c7a46),
    Color(0XFF870808),
    Color(0XFFf5f5f5),
  ];

  var fileCar = "1a1a1a.json".obs;

  List cars = [
    "1a1a1a.json",
    "4a90e2.json",
    "4c7a46.json",
    "870808.json",
    "f5f5f5.json",
  ];

  List imgList = [
    'assets/images/howtoplay1.png',
    'assets/images/howtoplay2.png',
    'assets/images/howtoplay3.png',
    'assets/images/howtoplay4.png',
    'assets/images/howtoplay5.png',
    'assets/images/howtoplay6.png',
    'assets/images/howtoplay7.png',
    'assets/images/howtoplay8.png',
    'assets/images/howtoplay9.png',
  ];

  void changeCarColor(Color colorChoose) {
    for (var i = 0; i < colors.length; i++) {
      if (colorChoose == colors[i]) {
        fileCar.value = cars[i];
        break;
      }
    }
  }

  void dialogPlay(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: (Get.width < 800)
              ? const EdgeInsets.symmetric(vertical: 140)
              : const EdgeInsets.all(0),
          child: AlertDialog(
            backgroundColor: whiteColor,
            title: Center(
              child: Text(
                "How To Play?",
                style: TextStyle(
                  color: darkColor,
                  fontSize: 20,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.all(2),
            actions: [
              Center(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: yellowColor,
                  ),
                  onPressed: () {
                    currentImg.value = 0;
                    Get.back();
                  },
                  child: Text(
                    "I Got It!",
                    style: TextStyle(color: darkColor),
                  ),
                ),
              ),
            ],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 2750),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        currentImg.value = index;
                      },
                    ),
                    items: imgList
                        .map(
                          (item) => Container(
                            margin: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: Image(
                                image: AssetImage(item),
                                width: (Get.width < 800)
                                    ? Get.height / 1.5
                                    : Get.width / 2,
                                height: (Get.width < 800)
                                    ? Get.height / 4
                                    : Get.height / 2,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map(
                    (entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Obx(
                          () => Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 4.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (currentImg.value == entry.key)
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
