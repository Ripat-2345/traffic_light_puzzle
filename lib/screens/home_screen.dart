import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/const.dart';
import 'package:flutter_game/controllers/home_controller.dart';
import 'package:flutter_game/controllers/slider_controller.dart';
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
  final sliderController = Get.put(SliderController());

  int _current = 0;
  final CarouselController _controller = CarouselController();

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
                    hint: Obx(
                      () => Center(
                        child: Text(
                          homeController.selectedLevel.value,
                          style: TextStyle(
                            color: whiteColor,
                          ),
                        ),
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
                      homeController.selectedLevel.value = value.toString();
                    },
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            backgroundColor: whiteColor,
                            title: Center(
                              child: Text(
                                "Cara Main",
                                style: TextStyle(
                                  color: darkColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 3.5),
                            actions: [
                              Center(
                                child: RaisedButton(
                                  color: yellowColor,
                                  onPressed: () => Get.back(),
                                  child: Text(
                                    "Mengerti",
                                    style: TextStyle(color: darkColor),
                                  ),
                                ),
                              )
                            ],
                            content: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: CarouselSlider(
                                      carouselController: _controller,
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        aspectRatio: 2.0,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _current = index;
                                          });
                                        },
                                      ),
                                      items: sliderController.imgList
                                          .map((item) => Container(
                                                child: Container(
                                                  margin: EdgeInsets.all(5.0),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      child: Stack(
                                                        children: <Widget>[
                                                          Image.network(item,
                                                              fit: BoxFit.cover,
                                                              width: 1000.0),
                                                          Positioned(
                                                            bottom: 0.0,
                                                            left: 0.0,
                                                            right: 0.0,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color
                                                                        .fromARGB(
                                                                            200,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    Color
                                                                        .fromARGB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0)
                                                                  ],
                                                                  begin: Alignment
                                                                      .bottomCenter,
                                                                  end: Alignment
                                                                      .topCenter,
                                                                ),
                                                              ),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          10.0,
                                                                      horizontal:
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: sliderController.imgList
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controller
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width: 12.0,
                                          height: 12.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black)
                                                  .withOpacity(
                                                      _current == entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ));
                      });
                },
                child: Text(
                  "Cara Bermain",
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
    );
  }
}
