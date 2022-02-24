import 'package:flutter/material.dart';
import 'package:flutter_game/controllers/home_controller.dart';
import 'package:flutter_game/screens/widgets/car_color_widget.dart';
import 'package:flutter_game/const.dart';
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
    return Title(
      title: "Home",
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
                height: (MediaQuery.of(context).size.width < 800) ? 300 : 300,
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    height: 40,
                    width: 120,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    child: Center(
                      child: DropdownButton(
                        iconEnabledColor: whiteColor,
                        dropdownColor: darkColor,
                        hint: Obx(
                          () => Text(
                            homeController.selectedLevel.value,
                            style: TextStyle(
                              color: whiteColor,
                              fontSize:
                                  (MediaQuery.of(context).size.width < 800)
                                      ? 20
                                      : 17,
                            ),
                            textAlign: TextAlign.center,
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
                                        (MediaQuery.of(context).size.width <
                                                800)
                                            ? 20
                                            : 17,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          homeController.selectedLevel.value = value.toString();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => homeController.dialogPlay(context),
                  child: Text(
                    "The Guideline",
                    style: TextStyle(
                      color: darkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
