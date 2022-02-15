import 'package:flutter/material.dart';
import 'package:flutter_game/const.dart';
import 'package:flutter_game/controllers/home_controller.dart';
import 'package:flutter_game/screens/game_screen.dart';
import 'package:flutter_game/screens/widgets/car_color_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: (MediaQuery.of(context).size.width < 800) ? 300 : 300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < homeController.color.length; i++)
                InkWell(
                  onTap: () =>
                      homeController.changeCarColor(homeController.color[i]),
                  child: CarColor(
                    color: homeController.color[i],
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  height: 40,
                  width: 130,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: darkColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: DropdownButton(
                    iconEnabledColor: whiteColor,
                    dropdownColor: darkColor,
                    hint: Text(
                      "Pilih level",
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    underline: DropdownButtonHideUnderline(
                      child: Container(),
                    ),
                    items: homeController.levels
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: whiteColor,
                                fontSize:
                                    (MediaQuery.of(context).size.width < 800)
                                        ? 20
                                        : 17,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      homeController.selected.value = value.toString();
                    },
                  ),
                ),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () => Get.to(const GameScreen()),
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
                    "Start Game",
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
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Cara Bermain",
                    titleStyle: TextStyle(
                      color: darkColor,
                      fontSize: 20,
                    ),
                    middleText: "Ubah Semua Lampu Menjadi Warna Hijau",
                    contentPadding: const EdgeInsets.all(20),
                    onConfirm: () => Get.back(),
                    textConfirm: "Mengerti",
                    confirmTextColor: darkColor,
                    buttonColor: yellowColor,
                  );
                },
                child: Text(
                  "Cara Bermain",
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
