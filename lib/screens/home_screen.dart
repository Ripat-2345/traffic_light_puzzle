import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game/const.dart';
import 'package:flutter_game/screens/game_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selected;
  List<String> data = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"];

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
              fontSize: (MediaQuery.of(context).size.width < 800) ? 30 : 40,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width < 800) ? 300 : 400,
            // height: (MediaQuery.of(context).size.width < 800) ? 120 : 480,
            child: Lottie.asset(
              "assets/images/car.json",
              // fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: 20,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        width: 30,
                        height: 35,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    height: 40,
                    width: 130,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: DropdownButton(
                      iconEnabledColor: whiteColor,
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      dropdownColor: darkColor,
                      value: selected,
                      hint: const Text(
                        "Pilih level",
                        style: TextStyle(color: Color(0XFFF0F0F0)),
                      ),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          selected = value.toString();
                        });
                      },
                      items: data
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0XFFF0F0F0),
                                  fontSize:
                                      (MediaQuery.of(context).size.width < 800)
                                          ? 20
                                          : 17,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () => Get.to(const GameScreen()),
                child: Container(
                  height: 40,
                  width: 130,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
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
              const SizedBox(
                width: 30,
              ),
              InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      height: 40,
                      width: 130,
                      padding: EdgeInsets.all(5),
                      child: TextButton(
                        onPressed: () => Get.defaultDialog(
                            backgroundColor: whiteColor,
                            title: "Tips",
                            content: Text(
                              "Ubah semua lampu menjadi lampu hijau!",
                              textAlign: TextAlign.center,
                            ),
                            confirm: ElevatedButton(
                                onPressed: () => Get.back(),
                                child: Text("OK !"))),
                        child: Text("Tips",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize:
                                    (MediaQuery.of(context).size.width < 800)
                                        ? 22
                                        : 19)),
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
