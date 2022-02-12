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
          const Text(
            "Traffic Light Puzzle",
            style: TextStyle(
              color: Color(0XFF3E497A),
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            // width: (MediaQuery.of(context).size.width < 800) ? 200 : 300,
            height: (MediaQuery.of(context).size.width < 800) ? 120 : 480,
            child: Lottie.asset(
              "assets/images/car.json",
              // fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                underline: DropdownButtonHideUnderline(child: Container()),
                dropdownColor: darkColor,
                value: selected,
                hint: const Text(
                  "Pilih level",
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
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => Get.to(const GameScreen()),
                child: const Text(
                  "Start Game",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
